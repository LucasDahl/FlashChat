//
//  ConversationPicker.swift
//  Flash Chat
//
//  Created by Lucas Dahl on 11/15/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ConversationPicker: UITableViewController {
    
    // Properties
    var conversationsArray = [""]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the total number of conversations
        return conversationsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConvoTable", for: indexPath)
        
        // Set the text
        cell.textLabel?.text = conversationsArray[indexPath.row]
        
        // Return the cell
        return cell
    }
    
    
    
    
    
}
