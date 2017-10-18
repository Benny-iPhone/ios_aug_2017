//
//  PersonCell.swift
//  HitList
//
//  Created by Benny Davidovitz on 15/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    func configure(with person : Person){

        firstNameLabel.text = person.firstName
        lastNameLabel.text = person.lastName
        
    }

}







