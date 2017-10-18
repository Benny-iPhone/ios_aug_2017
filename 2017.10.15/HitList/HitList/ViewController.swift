//
//  ViewController.swift
//  HitList
//
//  Created by Benny Davidovitz on 15/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        print(path)
        
        demoCreatePerson()
    }
    
    func demoCreatePerson(){
        let context = DatabaseManager.manager.persistentContainer.viewContext
        let p = Person(context: context)
        
        p.firstName = "Peter"
        p.lastName = "Baelish"
        p.birthDate = Date()
        p.imageName = UUID().uuidString
        
        DatabaseManager.manager.saveContext()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}










