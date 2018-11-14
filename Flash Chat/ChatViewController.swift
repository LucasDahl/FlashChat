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


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // Properties
    var messageArray = [Message]()
    
    // BOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate and datasource
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        // delegate of the text field
        messageTextfield.delegate = self
        
        
        // tapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        

        // Register MessageCell.xib file
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        // Connfigure the tableview
        configureTableView()
        
        // Retrieve the messages
        retrieveMessages()
        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods

    
    // CellForRowAtIndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creat the cell and declare it as the custom cell class to call properties
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
    
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "egg")
        
        // return the cell
        return cell
        
    }
    
    
    // NumberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  messageArray.count
    }
    
    
    // TableViewTapped
    @objc func tableViewTapped() {
        
        // Trigger the endEditing method to trigger the animation for the tap gesture.
        messageTextfield.endEditing(true)
        
    }
    
    
    // ConfigureTableView
    func configureTableView() {
        
        // Set the cell height
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120
        
    }
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    
    // textFieldDidBeginEditing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        // ANimate the pop up for the kewyboard
        UIView.animate(withDuration: 0.25) {
            
            // Set the height constrant for the textfield when it's tapped
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    
    // textFieldDidEndEditing
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // ANimate the pop up for the kewyboard
        UIView.animate(withDuration: 0.25) {
            
            // Set the height constrant for the textfield when it's tapped
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
            
        }
        
    }

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        // Call the end editing method
        messageTextfield.endEditing(true)
        
        // Send the message to Firebase and save it in our database
        
        // Temp disable UI elements to avoid problems sending to firebase
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        // This will be for messages in the database
        let messagesDB = Database.database().reference().child("Messages")
        
        // Save the users message as a dictionary based on the user
        let messageDictionary = ["Sender":Auth.auth().currentUser?.email, "MessageBody":messageTextfield.text!]
        
        // Creats a custom random ID for the database and saves it
        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                
                // Print the error
                print(error!)
                
            } else {
                
                // It worked
                print("The message was saved")
                
                // Enable the textFiled and sendButton
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                
                // Clear the text field after the message is sent
                self.messageTextfield.text = ""
                
                
                
            }
            
        }
        
    }
    
    // Create the retrieveMessages method here:
    func retrieveMessages() {
        
        // Get a reference to the Messages database
        let messageDB = Database.database().reference().child("Messages")
        
        // Grab the new messges saved into the database
        messageDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            
            // Create the message object
            let message = Message()
            
            // Set the message values
            message.messageBody = text
            message.sender = sender
            
            // Add the message to teh message array
            self.messageArray.append(message)
            
            // Configure the tableView and reload
            self.configureTableView()
            self.messageTableView.reloadData()
            
        }
        
    }
    

    
    
    
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
