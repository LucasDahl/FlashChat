//
//  ViewController.swift
//  Flash Chat
//
//
//  Created by Lucas Dahl 11/11/2018.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import UIKit
import Firebase


class ChatViewController: UIViewController {
    
    // Declare instance variables here

    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set yourself as the delegate and datasource here:
        
        
        
        // Set yourself as the delegate of the text field here:

        
        
        // Set the tapGesture here:
        
        

        // Register your MessageCell.xib file here:

        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    // Declare cellForRowAtIndexPath here:
    
    
    
    // Declare numberOfRowsInSection here:
    
    
    
    // Declare tableViewTapped here:
    
    
    
    // Declare configureTableView here:
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    // Declare textFieldDidBeginEditing here:
    
    
    
    
    // Declare textFieldDidEndEditing here:
    

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        
        // Send the message to Firebase and save it in our database
        
        
    }
    
    // Create the retrieveMessages method here:
    
    

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        // Log out the user and send them back to WelcomeViewController
        do {
            
            try Auth.auth().signOut()
            
            // Go to the Welcome(root) ViewController
            navigationController?.popToRootViewController(animated: true)
            
        } catch {
            
            // Prints the error
            print(error)
            
        }
        
    }// End logOutPressed
    


}
