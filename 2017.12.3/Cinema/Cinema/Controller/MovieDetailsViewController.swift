//
//  MovieDetailsViewController.swift
//  Cinema
//
//  Created by Benny Davidovitz on 03/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

protocol MovieDetailsViewControllerDelegate {
    func movieDetailsViewController(_ controller : MovieDetailsViewController, didFetchDetaildMovie dm : DetailedMovie)
}

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var imageView : UIImageView!
    
    var movie : Movie!
    var delegate : MovieDetailsViewControllerDelegate?
    var indexInArray : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = movie.title
        
        overviewTextView.text = movie.overview
        
        if let url = movie.posterUrl{
            imageView.sd_setImage(with: url)
        }
        
        if let dm = movie as? DetailedMovie{
            //details already fetched
            refresh(using: dm)
        } else {
            //fetching details from server
            APIManager.manager.getDetails(of: self.movie) { (dMovie) in
                if let dMovie = dMovie{
                    //notify moviesVC
                    self.delegate?.movieDetailsViewController(self, didFetchDetaildMovie: dMovie)
                    
                    //refresh UI
                    self.refresh(using: dMovie)
                }
            }
        }
        
    }
    
    func refresh(using detailedMovie : DetailedMovie){
        
        if let budget = detailedMovie.budget{
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            budgetLabel.text = formatter.string(from: budget as NSNumber)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        overviewTextView.contentOffset = .zero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
