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


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Properties

    
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

        
        
        // tapGesture
        
        

        // Register MessageCell.xib file
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        // Connfigure the tableview
        configureTableView()
        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    // CellForRowAtIndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Creat the cell and declare it as the custom cell class to call properties
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        // Text to displat in the cell
        let messageArray = ["First message", "Second Message", "Third Message"]
        
        cell.messageBody.text = messageArray[indexPath.row]
        
        // return the cell
        return cell
        
    }
    
    
    // NumberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  3
    }
    
    
    // TableViewTapped
    
    
    
    // ConfigureTableView
    func configureTableView() {
        
        // Set the cell height
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120
        
    }
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    // extFieldDidBeginEditing
    
    
    
    
    // textFieldDidEndEditing
    

    
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
