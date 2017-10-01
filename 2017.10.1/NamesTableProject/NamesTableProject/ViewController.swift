//
//  ViewController.swift
//  NamesTableProject
//
//  Created by Benny Davidovitz on 01/10/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var tableArray : [String] = ["foo","bar"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let arr = UserDefaults.standard.object(forKey: "array") as? [String]{
            self.tableArray = arr
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    @IBAction func saveAction(_ sender: Any) {
        
        UserDefaults.standard.set(tableArray, forKey: "array")
        UserDefaults.standard.synchronize()
        
    }
    
    
    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Name", message: "test message", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(dismissAction)
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            /*
            if let text = alert.textFields?.first?.text, !text.isEmpty{
                self.add(name: text)
            }
            */
            
            
            guard let text = alert.textFields?.first?.text, !text.isEmpty else{
                return
            }
            
            //print(text)
            self.add(name: text)
            
        }
        
        alert.addAction(submitAction)
        
        alert.addTextField {
            $0.placeholder = "type a name"
            $0.autocorrectionType = .no
            $0.textColor = .red
            $0.clearButtonMode = .always
        }
        
        //alert.addTextField(configurationHandler: <#T##((UITextField) -> Void)?##((UITextField) -> Void)?##(UITextField) -> Void#>)
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func add(name : String){
        //add to array
        //tableArray.append(name)
        tableArray.insert(name, at: 0)
        //refresh table-view
        //tableView.reloadData()
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
    }
    
    
    //MARK: - UITableView Data Source -
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let str = tableArray[indexPath.row]
        cell.textLabel?.text = str
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        tableArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
    
    //MARK: - UITableView Delegate -
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //remove selection
        tableView.deselectRow(at: indexPath, animated: true)
        
        //create alert instance
        let alert = UIAlertController(title: "Edit Name", message: nil, preferredStyle: .alert)
        
        //setup cancel button, do nothing on handler
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        //setup submit action, do an update on handler
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            
            guard let name = alert.textFields?.first?.text, !name.isEmpty else{
                return
            }
            
            self.update(name: name, at: indexPath)
            
        }
        
        alert.addAction(submitAction)
        
        //setup textfield
        alert.addTextField {
            $0.placeholder = "type a name"
            $0.text = self.tableArray[indexPath.row]
        }
        
        
        //present alert
        self.present(alert, animated: true, completion: nil)
        
        /* dummy code
        //update(name: "test", at: indexPath)
        
        //let name = tableArray[indexPath.row]
        //print("user pressed " + name)
        */
    }
    
    private func update(name : String, at indexPath : IndexPath){
        //update array
        
        tableArray[indexPath.row] = name
        
        //update ui
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}



















