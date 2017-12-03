//
//  MenuViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 03/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import RESideMenu

class MenuViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    let tableArray = APIManager.Endpoint.allEndpoints
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableArray[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let center = self.sideMenuViewController.contentViewController as? UINavigationController
        let moviesVC = center?.viewControllers.first as? MoviesViewController
        moviesVC?.endpoint = tableArray[indexPath.row]
        
        self.sideMenuViewController.hideViewController()
        
    }

}






