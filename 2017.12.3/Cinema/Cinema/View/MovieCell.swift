//
//  MovieCell.swift
//  Cinema
//
//  Created by Benny Davidovitz on 03/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        overviewTextView.isUserInteractionEnabled = false
    }
    
    func configure(with movie : Movie){
        
        movieTitleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        overviewTextView.text = movie.overview
        //scroll textview to top
        overviewTextView.contentOffset = .zero
        
        if let url = movie.thumbnailPosterUrl{
            posterImageView.sd_setImage(with: url)
        } else {
            posterImageView.image = nil
            posterImageView.sd_cancelCurrentImageLoad()
        }
        
    }
    
}




















