//
//  FuelStationsTableViewController.swift
//  FuelStations
//
//  Created by Benny Davidovitz on 17/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class FuelStationsTableViewController: UITableViewController {

    var tableArray : [FuelStation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshDataAndTableView()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(refreshDataAndTableView), for: .valueChanged)
        
        NotificationCenter.default.addObserver(forName: .locationUpdated, object: nil, queue: .main) { (note) in
            self.tableView.reloadData()
        }
        
    }
    
    @objc func refreshDataAndTableView(){
        
        AppManager.manager.getNearbyFuelStations {
            self.tableArray = $0
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            
        }
        
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
        
        if let userLocation = AppManager.manager.currentLocation{
            let distance = userLocation.distance(from: obj.location) //meters
            cell.detailTextLabel?.text = String(format: "%.2f km", distance / 1000)
        } else {
            cell.detailTextLabel?.text = "N/A"
        }

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let nextVC = segue.destination as? DetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow{
            nextVC.station = tableArray[indexPath.row]
        }
    }
    

}









