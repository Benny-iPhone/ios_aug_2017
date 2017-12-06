//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Benny Davidovitz on 06/12/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tapAction(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else{
            "email is missing".showError()
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else{
            "password is missing".showError()
            return
        }
        
        
        AuthLogic.shared.loginWith(email: email, password: password) { (err) in
            if let err = err {
                err.localizedDescription.showError()
            } else {
                "Login Success".showSuccess()
            }
        }
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else{
            "email is missing".showError()
            return
        }
        
        AuthLogic.shared.forgotPassword(with: email) { (err) in
            if let err = err {
                err.localizedDescription.showError()
            } else {
                "an email sent".showSuccess()
            }
        }
    }
    
}







