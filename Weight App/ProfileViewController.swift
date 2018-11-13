//
//  ProfileViewController.swift
//  Weight App
//
//  Created by period2 on 10/30/18.
//  Copyright © 2018 period2. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var TVindexPatH = Int()
    
    var TTTTtext = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    var oneRepMax = [[String: String]]()
    var numArray = [Int]()
    
    var alertTextField = UITextField()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let a = ["name": "Bench", "orm": "0", "pos" : "0"]
        oneRepMax.append(a)
        let b = ["name": "Squat", "orm": "0", "pos" : "1"]
        oneRepMax.append(b)
        
        var counter = 0
        while counter < 84
        {
            numArray.append(counter)
            counter += 1
            print(counter)
            print(numArray)
        }
        
        fixTheArray()
        
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
        TVindexPatH = indexPath.row
        alert(lift: oneRepMax[TVindexPatH]["name"]!)
        
//        let newNum = alert(lift: index["name"]!)
//        if (index.updateValue(alert(lift: index["name"]!), forKey: "orm") != nil)
//        {
//            print("------------------------------------IT WORKED")
//        }
//        print(oneRepMax)
//        tableView.reloadData()
        
        
    }
    
    func changeItUp(index: [String: String])
    {
        
    }
    
    func alert(lift: String)
    {
        var ORM = String()
        let alert = UIAlertController(title: "What's your one rep max for \(lift)?", message: nil, preferredStyle: .alert)
        alert.addTextField { (AlertTextField) in
            AlertTextField.keyboardType = UIKeyboardType.numberPad
            self.alertTextField = alert.textFields![0] as UITextField
        }
        let confirm = UIAlertAction(title: "Ok", style: .default){ (UIAlertAction) in
            ORM = self.alertTextField.text!
            var index = self.oneRepMax[self.TVindexPatH]
            var updatedIndex = self.TVindexPatH - 1
            self.oneRepMax.remove(at: self.TVindexPatH)
            self.oneRepMax.append( [ "name": index["name"]!, "orm": ORM , "pos" : "\(index["pos"] ?? "BROKEN BROKEN BROKEN")"])
            self.tableView.reloadData()

            }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: false, completion: nil)
        
    }
    
    func fixTheArray()
    {
        var oneRepMaxCopy = [[String: String]]()
        for i in oneRepMax
        {
            oneRepMaxCopy.append(i)
        }
        oneRepMax.removeAll()
        for i in oneRepMaxCopy
        {
            for ii in numArray
            {
                if i["pos"] == "\(ii)"
                {
                    oneRepMax.append(i)
                } else if i["pos"] == "BROKEN BROKEN BROKEN" {
                    print("BROKEN")
                }
            }
        }
        
        print(oneRepMax)
    }

    
    
    
}
