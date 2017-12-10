//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 06/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import PKHUD
import FBSDKLoginKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.becomeFirstResponder()
    }
    @IBAction func tapAction(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        guard let email = emailTextField.text, !email.isEmpty else{
//            emailTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
            "email is missing".showError()
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else{
            "password is missing".showError()
            return
        }
        
        guard let name = nameTextField.text, !name.isEmpty else{
            "name is missing".showError()
            return
        }
        
        AuthLogic.shared.registerWith(email: email, password: password, name: name, image: nil) { (err) in
            if let err = err {
                err.localizedDescription.showError()
            } else {
                "Register Success".showSuccess()
            }
        }
        
        
    }
    
    
    @IBAction func facebookAction(_ sender: Any) {
        
        let manager = FBSDKLoginManager()
        manager.logIn(withReadPermissions: ["public_profile","email"], from: self) { (result, error) in
            
            guard let token = result?.token.tokenString else{
                error?.localizedDescription.showError()
                return
            }
            
            AuthLogic.shared.facebookLogin(with: token, callback: { (err) in
                err?.localizedDescription.showError()
            })
            
        }
        
    }
    

}















