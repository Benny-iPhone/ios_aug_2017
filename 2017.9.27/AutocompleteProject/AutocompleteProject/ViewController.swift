//
//  ViewController.swift
//  AutocompleteProject
//
//  Created by Benny Davidovitz on 27/09/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
    }


}

extension ViewController : UITextFieldDelegate{
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let nextVC = GMSAutocompleteViewController()
        nextVC.delegate = self
        self.present(nextVC, animated: true, completion: nil)
        
        //don't open keyboard
        return false
    }
    
}

extension ViewController : GMSAutocompleteViewControllerDelegate{
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        let str = place.name + " " + (place.formattedAddress ?? "")
        
        viewController.dismiss(animated: true) { 
            self.textField.text = str
        }
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {

        print(error)
        
        //remove it
        viewController.dismiss(animated: true, completion: nil)

    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
        //remove it
        viewController.dismiss(animated: true, completion: nil)
        
    }
    
}















