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
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactIdentifier", for: indexPath) as! HomeTableViewCell

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
    
//    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        self.selectedContact = contacts[indexPath.row]
//        return indexPath
//    }
    

}