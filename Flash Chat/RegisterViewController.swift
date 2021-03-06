//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Lucas Dahl 11/11/2018.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
    // IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        
        // Show to SV Progress
        SVProgressHUD.show()
        
        // Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            
            if error != nil {
                
                print(error!)
                
                // TODO: Add errors to the user for weak passwords
                
                
            } else {
                
                // Success
                print("Reistration Successful!")
                
                // Move to the chat screen after successful regestration
                self.performSegue(withIdentifier: "goToChat", sender: self)
                
                // Dismiss the progress hub
                SVProgressHUD.dismiss()
                
            }
            
        }
        
        
    } 
    
    
}
