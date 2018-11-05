//
//  ProfileViewController.swift
//  Weight App
//
//  Created by period2 on 10/30/18.
//  Copyright © 2018 period2. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var oneRepMax = [[String: Any]]()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ormSetUp()
        
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
        cell.detailTextLabel?.text = String(ormIndex["orm"] as! Int)
        return cell
    }
    
    func parse(json: [String: Any])
    {
        for i in json
        {
            
        }
    }
    
    func ormSetUp()
    {
        let a = ["name": "Bench", "orm": 0] as [String : Any]
        oneRepMax.append(a)
        let b = ["name": "Squat", "orm": 0] as [String: Any]
        oneRepMax.append(b)
    }

}
