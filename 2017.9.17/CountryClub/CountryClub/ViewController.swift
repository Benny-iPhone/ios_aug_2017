//
//  ViewController.swift
//  CountryClub
//
//  Created by Benny Davidovitz on 17/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{

    let tableArray : [Country] = Country.readFile()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let c : Country = tableArray[indexPath.row]
        
        cell.textLabel?.text = c.name
        cell.detailTextLabel?.text = c.code
        
        return cell
    }
}














