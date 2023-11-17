//
//  ViewStarTableViewController.swift
//  StarInfoApp
//
//  Created by Roshan Uchai on 17/11/2023.
//

import UIKit

class ViewStarTableViewController: UITableViewController {
    
    var starInfo : StarInfo!
    
    
    @IBOutlet weak var StarImageView: UIImageView!
    
    @IBOutlet weak var occupationlbl: UILabel!
    @IBOutlet weak var bornDate: UIButton!
    @IBOutlet weak var FullName: UILabel!
    @IBOutlet weak var BirthCountryBtn: UIButton!
    @IBOutlet weak var nationalityBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        print(starInfo.Name)
        
        StarImageView.layer.cornerRadius = StarImageView.frame.size.width / 2
        StarImageView.clipsToBounds = true
        StarImageView.layer.borderWidth = 4.0
        StarImageView.layer.borderColor = UIColor.black.cgColor
        
        
        if !starInfo.Image.isEmpty{
            if UIImage(named: starInfo.Image) != nil{
                StarImageView.image = UIImage(named: starInfo.Image)
            }
            FullName.text = "\(starInfo.Name)"
            occupationlbl.text = "\(starInfo.Occupation)"
            bornDate.setTitle("\(starInfo.Born)", for: UIControl.State.normal)
            nationalityBtn.setTitle("\(starInfo.Nationality)", for: UIControl.State.normal)
            BirthCountryBtn.setTitle("\(starInfo.Birthplace)", for: UIControl.State.normal)
            
        }
    }
        
        
        /*
         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
         
         // Configure the cell...
         
         return cell
         }
         */
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
      
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if let EditStarTableViewController = segue.destination as? EditStarTableViewController{
                 EditStarTableViewController.starInfo = self.starInfo
             }
         }
        
        
    
}
