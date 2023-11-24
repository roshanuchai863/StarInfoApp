//
//  AddStartTableViewController.swift
//  StarInfoApp
//
//  Created by Roshan Uchai on 24/11/2023.
//

import UIKit

class AddStartTableViewController: UITableViewController {
    @IBOutlet weak var FirstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var DOBTxtField: UITextField!
    @IBOutlet weak var BirthplaceTxtField: UITextField!
    @IBOutlet weak var NationalityTxtField: UITextField!
    @IBOutlet weak var OccupationTxtField: UITextField!
    
    @IBOutlet weak var imageName: UITextField!
    var starInfo : StarInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
     @IBAction func firstNameTextField(_ sender: Any) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let firstName = FirstNameTxtField.text!
        let LastName = lastNameTxtField.text!
        let FullName = "\(firstName) \(LastName)";
        let Occupation = OccupationTxtField.text!
        let Nationality = NationalityTxtField.text!
        let Birthplace = BirthplaceTxtField.text!
        let imageName = imageName.text!
        let Born = DOBTxtField.text!
        
        starInfo = StarInfo(Name: FullName, Born: Born, Nationality: Nationality, Occupation: Occupation, Birthplace: Birthplace, Image: imageName)
        
        if let homeViewtableController = segue.destination as? HomeTableViewController{
            homeViewtableController.selectedStar = starInfo
            
            
        }
        
        
        
        
    }
    

}
