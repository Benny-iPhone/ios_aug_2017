//
//  MoviesViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 29/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CCBottomRefreshControl
import RESideMenu

class MoviesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView : UITableView!
    var tableArray : [Movie] = []
    weak var refreshControl : UIRefreshControl!
    
    var endpoint : APIManager.Endpoint = .nowPlaying{
        didSet{
            navigationItem.title = endpoint.name
            self.page = 1
        }
    }
    
    var page : Int = 1{
        didSet{
            refreshDataAndTableView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        tableView.addSubview(refreshControl)
        self.refreshControl = refreshControl
        
        let bottomRefreshControl = UIRefreshControl()
        bottomRefreshControl.addTarget(self, action: #selector(loadNextPage), for: .valueChanged)
        bottomRefreshControl.triggerVerticalOffset = 100
        tableView.bottomRefreshControl = bottomRefreshControl

        tableView.dataSource = self
        tableView.delegate = self
        
        refreshDataAndTableView()
        
        
    }
    
    
    @IBAction func sideMenuAction(_ sender: Any) {
        
        self.sideMenuViewController.presentLeftMenuViewController()
        
    }
    
    @objc func reload(){
        self.page = 1
    }
    
    @objc func loadNextPage(){
        self.page += 1
    }
    
    func refreshDataAndTableView(){
        APIManager.manager.getMovies(using: self.endpoint, page: self.page) { (movies) in
            
            self.refreshControl?.endRefreshing()
            self.tableView.bottomRefreshControl?.endRefreshing()
            
            if self.page == 1{
                self.tableArray = movies
            } else {
                self.tableArray += movies
            }
            
            self.tableView.reloadData()
            
        }
    }
    
    //MARK: - UITableView Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        
        cell.configure(with: tableArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? MovieDetailsViewController,
            let indexPath = tableView.indexPathForSelectedRow{
            
            nextVC.movie = tableArray[indexPath.row]
            nextVC.indexInArray = indexPath.row
            nextVC.delegate = self
        }
    }
    
}

extension MoviesViewController : MovieDetailsViewControllerDelegate{
    
    func movieDetailsViewController(_ controller: MovieDetailsViewController, didFetchDetaildMovie dm: DetailedMovie) {
        
        self.tableArray[controller.indexInArray] = dm
        
    }
    
}



















