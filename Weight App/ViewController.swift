//
//  ViewController.swift
//  Weight App
//
//  Created by period2 on 10/29/18.
//  Copyright © 2018 period2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var switcher: UIBarButtonItem!
    
    var transition = 0
    
    var position = 0
    
    var defaults = UserDefaults.standard
    
    var to = 0
    
    var master = [String : [String: [String: [String: Any]]]]()
    
    
    var activeLiftsKey = String()
    var activeLifts = [String]()
    {
        didSet{
            defaults.set(activeLifts, forKey: activeLiftsKey)
        }
    }
    
    var boySports = ["Baseball", "Basketball", "Cheerleading", "Cross Country", "Football", "Golf", "Gymnastics", "Soccer", "Swimming/Diving", "Tennis", "Track", "Water Polo", "Wrestling"]
    
    
    var girlSports = ["Cross Country", "Swimming/Diving", "Golf", "Tennis", "Volleyball", "Basketball", "Bowling", "Gymnastics", "Badminton", "Soccer", "Softball", "Track", "Water Polo"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let saveData = defaults.object(forKey: activeLiftsKey) as? [String]
        {
            activeLifts = saveData
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switcher.title = "flip"
        self.title = "Boys Lifts"
        activeLifts = boySports
        
    }
    
    @IBAction func boyGirlCycle(_ sender: UIBarButtonItem) {
        if position == 1
        {
            activeLifts.removeAll()
            for i in boySports
            {
                activeLifts.append(i)
            }
            position = 0
            tableView.reloadData()
            self.title = "Boys Lifts"
        }else if position == 0{
            activeLifts.removeAll()
            for i in girlSports
            {
                activeLifts.append(i)
            }
            position = 1
            tableView.reloadData()
            self.title = "Girls Lifts"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeLifts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let index = indexPath.row
        cell.textLabel!.text = activeLifts[index]
        cell.detailTextLabel!.text = ""
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let vc = segue.destination as! LiftViewController
        let index = tableView.indexPathForSelectedRow?.row
        vc.sport = activeLifts[index!]
    }
}

