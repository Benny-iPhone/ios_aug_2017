//
//  ChatRoomsTableViewController.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 10/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ChatRoomsTableViewController: UITableViewController {

    var tableArray : [ChatRoom] = []
    var handle : UInt?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        handle = DatabaseLogic.shared.trackAllRooms(with: {
            self.tableArray = $0
            self.tableView.reloadData()
        })
    }
    
    deinit {
        if let handle = handle{
            DatabaseLogic.shared.chatroomsRef.removeObserver(withHandle: handle)
        }
    }
    
    @IBAction func addAction(){
        let alert = UIAlertController(title: "Create Room", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Insert the new room name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let submitAction = UIAlertAction(title: "Sumbit", style: .default) { (action) in
            
            guard let text = alert.textFields?.first?.text, !text.isEmpty else{
                return
            }
            
            DatabaseLogic.shared.createRoom(with: text)
            
        }
        
        alert.addAction(submitAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let obj = tableArray[indexPath.row]
        cell.textLabel?.text = obj.name
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.doesRelativeDateFormatting = true
        
        cell.detailTextLabel?.text = formatter.string(from: obj.date)

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let uid = AuthLogic.shared.currentUserId else{
            return false
        }
        
        let obj = tableArray[indexPath.row]
        return obj.owner == uid
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            DatabaseLogic.shared.removeRoom(tableArray[indexPath.row])
            
        }
    }
    

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let nextVC = segue.destination as? ChatViewController,
            let indexPath = tableView.indexPathForSelectedRow{
            
            nextVC.chatRoom = tableArray[indexPath.row]
            
        }
        
    }
    

}








