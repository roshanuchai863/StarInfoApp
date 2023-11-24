//
//  HomeTableViewController.swift
//  StarInfoApp
//
//  Created by Roshan Uchai on 12/11/2023.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    
    @IBOutlet var StarHomeTableView: UITableView!
    let StarInformation = StarRepository()
    var StarInfos = [StarInfo]()
    var selectedStar: StarInfo!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = StarInformation.db.collection("StarInfo")
            .addSnapshotListener { querySnapshot, error in
                if let documents = querySnapshot?.documents {
                    self.StarInfos = documents.compactMap({ queryDocumentSnapshot -> StarInfo? in
                        let data = queryDocumentSnapshot.data()
                        return StarInfo(id: queryDocumentSnapshot.documentID, dictionary: data)
                    })
                    
                    for StarInfo in self.StarInfos {
                        print(StarInfo.toString())
                    }
                    self.StarHomeTableView.reloadData()
                }else{
                    print("Error fetching documents \(error!)")
                    return
                }
                
            }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StarInfos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "startIdentifier", for: indexPath) as! HomeTableViewCell
        
        // Configure the cell...
        let starInfo = StarInfos[indexPath.row]
        
        //if there is an image to look for in the assests folder and the image exists
        if !starInfo.Image.isEmpty && UIImage(named: starInfo.Image) != nil {
            cell.PhotoImageView.image = UIImage(named: starInfo.Image)
        }else{//This else is needed to reset the default image, else gets cached it and display the wrong one whenever the image cannot be found in the project
            cell.PhotoImageView.image = UIImage(systemName: "person.circle.fill")
        }
        
        //To round the image
        cell.PhotoImageView.layer.cornerRadius = cell.PhotoImageView.frame.size.width / 2
        cell.PhotoImageView.clipsToBounds = true
        cell.PhotoImageView.layer.borderWidth = 2.0
        cell.PhotoImageView.layer.borderColor = UIColor.white.cgColor
        
        
        
        
        
        cell.Name.text = starInfo.Name
        cell.Born.text = starInfo.Born
        cell.Nationality.text = starInfo.Nationality
        cell.Occupation.text = starInfo.Occupation
        cell.Birthplace.text = starInfo.Birthplace
        
        
        
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.selectedStar = StarInfos[indexPath.row]
        return indexPath
    }
    
    @IBAction func logout(_ sender: Any) {
        
        let loginVC = self.storyboard?.instantiateViewController(identifier: "loginNC") as? UINavigationController
        self.view.window?.rootViewController = loginVC
        self.view.window?.makeKeyAndVisible()
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let viewStarTVC = segue.destination as? ViewStarTableViewController{
            viewStarTVC.starInfo = selectedStar
        }
    }
    
    
    @IBAction func unwindToEditView(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
        if let EditStarScreen =  sourceViewController as? EditStarTableViewController {
            
            if StarInformation.update(starInfo: self.selectedStar){
                print("Edited data Saved")
            }
        }
    }
    
    
    // unwind after Signup success
    @IBAction func unwindToSignUp(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
        if let SignUpScreen = sourceViewController as? SignUpTableViewController {
            
            
            print("return from sign up page")
            
        }
    }
    
    
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let starinfo = StarInfos[indexPath.row]
            
            
//            let StarInformation = StarRepository()
//            var StarInfos = [StarInfo]()
//            var selectedStar: StarInfo!
            
            
            deleteConfirmationMessage(title: "Delete",
                                      message: "Are you sure you want to permamently delete \(starinfo.Name) ?",
                                      delete: {
                                                    if self.StarInformation.delete(starInfo: starinfo){
                                                    print("starInfo Deleted")
                                                    }
            },
             cancel: {
                    print("Cancelled")
                
            })
            
          


            
            
            //tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
  
    
    func deleteConfirmationMessage(title:String,
                                   message: String,
                                   delete: ( () -> Void )?,
                                   cancel: ( () -> Void)? ){
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.actionSheet)
        
        let deleteAction: UIAlertAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive){
            action -> Void in delete?()
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default){
            action -> Void in cancel?()
        }
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated:true)
        
    }
    
    // unwind after login success
    @IBAction func unwindToHomeTableViewControllerfromLogin(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
    }
    
    @IBAction func unwindToHomeTableViewControllerfromadd(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
        if sourceViewController is AddStartTableViewController{
            if StarInformation.add(starInfo: selectedStar){
                print("added successfully")}
        }
    }
    
}
