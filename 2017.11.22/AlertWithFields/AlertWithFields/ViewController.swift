//
//  ViewController.swift
//  AlertWithFields
//
//  Created by Benny Davidovitz on 22/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func makeLoginAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        
        func handler(_ action : UIAlertAction){
            print("handler")
            
            let username = alert.textFields?.first?.text
            let password = alert.textFields?.last?.text
            
            self.validate(username: username, password: password)
            /*
            if username == "moshe" && password == "1234"{
                print("login success")
            } else {
                print("login failed")
            }
            */
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let loginAction = UIAlertAction(title: "Login", style: .default, handler: handler)
        
        alert.addAction(cancelAction)
        alert.addAction(loginAction)
        
        alert.addTextField { (usernameTextField) in
            usernameTextField.placeholder = "Enter your username"
        }
        
        alert.addTextField {
            $0.placeholder = "Type your password"
            $0.isSecureTextEntry = true
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func validate(username : String?, password : String?){
        
        guard let username = username, let password = password else{
            return
        }
        
        let urlString = "http://5.189.170.57/api/login.php?username=" + username + "&password=" + password
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //handling http result
            guard let data = data else{
                print(error?.localizedDescription ?? "unkown error")
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else{
                return
            }
            
            print(json)
            
            
        }.resume()
        
    }
    

}


















