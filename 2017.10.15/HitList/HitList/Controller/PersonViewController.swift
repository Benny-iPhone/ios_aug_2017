//
//  PersonViewController.swift
//  HitList
//
//  Created by Benny Davidovitz on 15/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreData

class PersonViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(takePicAction))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func takePicAction(){
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        let context = DatabaseManager.manager.context
        
        let p = Person(context: context)
        p.firstName = firstNameTextField.text
        p.lastName = lastNameTextField.text
        
        //TODO: - birthdate
        //TODO: - image
        
        DatabaseManager.manager.saveContext()
        
        //back
        self.navigationController?.popViewController(animated: true)
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
