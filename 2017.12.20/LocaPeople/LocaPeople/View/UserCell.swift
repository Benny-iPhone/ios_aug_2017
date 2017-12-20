//
//  UserCell.swift
//  LocaPeople
//
//  Created by Benny Davidovitz on 20/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import SDWebImage

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with user : User)
    {
        nameLabel.text = user.name.first + " " + user.name.last
        imageView.sd_setImage(with: user.picture.medium, placeholderImage: #imageLiteral(resourceName: "icons8-anonymous_mask"))
        
        switch user.gender {
        case .female:
            imageView.layer.borderColor = UIColor.purple.cgColor
        case .male:
            imageView.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
        
        imageView.superview?.layer.cornerRadius = imageView.bounds.width / 2
        imageView.superview?.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        imageView.superview?.layer.shadowColor = UIColor.black.cgColor
        imageView.superview?.layer.shadowOpacity = 1
        imageView.superview?.layer.shadowRadius = 3
    }
    
}














