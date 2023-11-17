//
//  EditStarTableViewController.swift
//  StarInfoApp
//
//  Created by Roshan Uchai on 17/11/2023.
//

import UIKit

class EditStarTableViewController: UITableViewController {
    
    var starInfo : StarInfo!
    
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var StarImageView: UIImageView!
    @IBOutlet weak var BornDateTextField: UITextField!
    
    @IBOutlet weak var OccupationTextField: UITextField!
    @IBOutlet weak var NationalityTextField: UITextField!
    @IBOutlet weak var BirthplaceTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        StarImageView.layer.cornerRadius = StarImageView.frame.size.width / 2
        StarImageView.clipsToBounds = true
        StarImageView.layer.borderWidth = 4.0
        StarImageView.layer.borderColor = UIColor.black.cgColor
        
        
        
        if !starInfo.Image.isEmpty{
            if UIImage(named: starInfo.Image) != nil{
                StarImageView.image = UIImage(named: starInfo.Image)
            }}
            FirstNameTextField.text = "\(starInfo.Name)"
            OccupationTextField.text = "\(starInfo.Occupation)"
            BornDateTextField.text = "\(starInfo.Born)"
            NationalityTextField.text = "\(starInfo.Nationality)"
            BirthplaceTextField.text = "\(starInfo.Birthplace)"
            
        
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let HomeTableViewController = segue.destination as? HomeTableViewController
        {
            // set the altered data in out locatl starinfo object
            starInfo.Name = FirstNameTextField.text!
            starInfo.Born = BornDateTextField.text!
            starInfo.Occupation = OccupationTextField.text!
            starInfo.Nationality = NationalityTextField.text!
            starInfo.Birthplace = BirthplaceTextField.text!
            
            
            //finally we set it to the starinfo to
            HomeTableViewController.selectedStar = starInfo!
        }
    }
    
   
}
