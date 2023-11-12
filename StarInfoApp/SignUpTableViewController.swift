//
//  SignUpTableViewController.swift
//  StarInfoApp
//
//  Created by Roshan Uchai on 11/11/2023.
//

import UIKit
import Firebase


class SignUpTableViewController: UITableViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBAction func goToLogin(_ sender: Any) {}
    @IBOutlet weak var PasswordTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func SignUp(_ sender: UIButton) {
        
        let email = EmailTextField.text
        let password = PasswordTextField.text
        
        let alert = UIAlertController(title: "Successful", message: "\( email!) has been created successfully", preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            
            if let e = error{
                print("Error, \(e)")
            }
            else{
                print("signup successful")
                // self.present(alert, animated: true, completion: nil)
                //self.performSegue(withIdentifier: "SignUpToHome", sender: sender)
                
            }
        }}

}
