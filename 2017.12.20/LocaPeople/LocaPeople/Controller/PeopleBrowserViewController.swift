//
//  PeopleBrowserViewController.swift
//  LocaPeople
//
//  Created by Benny Davidovitz on 20/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class PeopleBrowserViewController: UIViewController , UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    var collectionArray : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        
        loadDataAndRefreshCollectionView()
    }

    func loadDataAndRefreshCollectionView(){
        
        APIManager.manager.getUsers { (users, error) in
            if let error = error{
                //display alert
                let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            //set data
            self.collectionArray = users ?? []
            //refresh UI
            self.collectionView.reloadData()
            
        }
        
    }
    
    //MARK: - UICollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UserCell
        
        let userObj = collectionArray[indexPath.item]
        cell.configure(with: userObj)
        
        return cell
        
    }
}












