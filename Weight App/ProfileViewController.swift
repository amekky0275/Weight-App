//
//  ProfileViewController.swift
//  Weight App
//
//  Created by period2 on 10/30/18.
//  Copyright © 2018 period2. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var TTTTtext = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    var oneRepMax = [[String: String]]()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ormSetUp()
        
        tableView.reloadData()
    }
    
    @IBAction func refreshButton(_ sender: UIBarButtonItem) {
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oneRepMax.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        let index = indexPath.row
        let ormIndex = oneRepMax[index]
        cell.textLabel?.text = ormIndex["name"]
        cell.detailTextLabel?.text = ormIndex["orm"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath: Int = indexPath.row
        oneRepMax[indexPath]["orm"] = alert(lift: oneRepMax[indexPath]["name"]!)
        print(oneRepMax)
        tableView.reloadData()
    }
    
    func alert(lift: String) -> String
    {
        var ORM = ""
        let alert = UIAlertController(title: "What's your one rep max for \(lift)?", message: nil, preferredStyle: .alert)
        alert.addTextField { (AlertTextField) in
            AlertTextField.keyboardType = UIKeyboardType.numberPad
        }
        let confirm = UIAlertAction(title: "Ok", style: .default){ (UIAlertAction) in
            let alertTextField = alert.textFields![0] as UITextField
            ORM = alertTextField.text!
            }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: false, completion: nil)
        return ORM
    }
    
    func ormSetUp()
    {
        let a = ["name": "Bench", "orm": "0"]
        oneRepMax.append(a)
        let b = ["name": "Squat", "orm": "0"]
        oneRepMax.append(b)
    }

}
