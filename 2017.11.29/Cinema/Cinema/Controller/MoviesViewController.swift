//
//  MoviesViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 29/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController , UITableViewDataSource{
    
    @IBOutlet weak var tableView : UITableView!
    var tableArray : [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        refreshDataAndTableView()
    }
    
    func refreshDataAndTableView(){
        APIManager.manager.getMovies(using: .nowPlaying, page: 1) { (movies) in
            
            self.tableArray = movies
            self.tableView.reloadData()
            
        }
    }
    
    //MARK: - UITableView Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableArray[indexPath.row].title
        cell.detailTextLabel?.text = tableArray[indexPath.row].overview
        
        return cell
    }

}



















