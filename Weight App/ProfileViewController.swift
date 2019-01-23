//
//  ProfileViewController.swift
//  Weight App
//
//  Created by period2 on 10/30/18.
//  Copyright © 2018 period2. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let query = "https://weight-app-b87b2.firebaseio.com/"
    
    // 0 = girls, 1 = boys
    var gender = Int()
    
    var defaults = UserDefaults.standard
    
    var TVindexPatH = Int()
    
    var TTTTtext = String()
    
    @IBOutlet weak var tableView: UITableView!
    
    var saveVar = String()
    var oneRepMax = [[String: Any]]()
    {
        didSet{
            defaults.set(oneRepMax, forKey: saveVar)
        }
    }
    
    let nameArr = ["Bench", "Squat", "Dead Lift", "Hang Clean", "Power Clean"]
    
    var numArray = [Int]()
    
    var alertTextField = UITextField()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let a = ["name": "Bench", "orm": "0"] as [String : Any]
        oneRepMax.append(a)
        let b = ["name": "Squat", "orm": "0"] as [String : Any]
        oneRepMax.append(b)
        let c = ["name": "Dead Lift", "orm": "0"] as [String : Any]
        oneRepMax.append(c)
        let d = ["name": "Hang Clean", "orm": "0"] as [String : Any]
        oneRepMax.append(d)
        let e = ["name": "Power Clean", "orm": "0"] as [String : Any]
        oneRepMax.append(e)
        
        var counter = 0
        while counter < 84
        {
            numArray.append(counter)
            counter += 1
        }
        
        if let url = URL(string: query)
        {
            if let data = try? Data(contentsOf: url)
            {
                let json = try! JSON(data: data)
                if json["status"] = working
                {
                    
                }
                
            }
        }
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let saveData = defaults.object(forKey: saveVar) as? [[String: String]]
        {
            oneRepMax = saveData
        }
    }
    
    func parse(json: JSON)
    {
        
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
        cell.textLabel?.text = ormIndex["name"] as! String
        cell.detailTextLabel?.text = ormIndex["orm"] as! String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TVindexPatH = indexPath.row
        alert(lift: oneRepMax[TVindexPatH]["name"]! as! String)
        
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

            self.oneRepMax.insert(["name": index["name"]!, "orm": ORM], at: self.TVindexPatH)
        
            self.tableView.reloadData()
            
            print(self.oneRepMax)

            }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: false, completion: nil)
        
    }
}
