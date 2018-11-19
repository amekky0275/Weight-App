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
    
    var position = 0
    
    var defaults = UserDefaults.standard
    
    var master = [String : [String: [String: [String: Any]]]]()
    
    
    var activeLiftsKey = String()
    var activeLifts = [String]()
    {
        didSet{
            defaults.set(activeLifts, forKey: activeLiftsKey)
        }
    }
    
    var boySportsKey = String()
    var boySports = [String]()
    {
        didSet{
            defaults.set(boySports, forKey: boySportsKey)
        }
    }
    
    var girlSportsKey = String()
    var girlSports = [String]()
    {
        didSet{
            defaults.set(girlSports, forKey: girlSportsKey)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let saveData = defaults.object(forKey: activeLiftsKey) as? [String]
        {
            activeLifts = saveData
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boySports = ["Cross Country", "Soccer", "Football", "Golf", "Basketball", "Swimming/Diving", "Wrestling", "Cheerleading", "Baseball", "Gymnastics", "Tennis", "Track", "Volleyball", "Water Polo"]
        girlSports = ["Cross Country", "Swimming/Diving", "Golf", "Tennis", "Volleyball", "Basketball", "Bowling", "Gymnastics", "Badminton", "Soccer", "Softball", "Track", "Water Polo"]
        switcher.title = "Girls"
        switcher.tintColor = UIColor.magenta
        self.title = "Boys Lifts"

        
    }
    
    @IBAction func boyGirlCycle(_ sender: UIBarButtonItem) {
        if position == 0
        {
            activeLifts.removeAll()
            for i in boySports
            {
                activeLifts.append(i)
            }
            position = 1
            tableView.reloadData()
            self.title = "Boys Lifts"
            sender.title = "Girls"
            sender.tintColor = UIColor.magenta
        }else if position == 1{
            activeLifts.removeAll()
            for i in girlSports
            {
                activeLifts.append(i)
            }
            position = 0
            tableView.reloadData()
            self.title = "Girls Lifts"
            sender.title = "Boys"
            sender.tintColor = UIColor.blue
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! LiftViewController
        let index = tableView.indexPathForSelectedRow?.row
        vc.sport = activeLifts[index!]
    }
    
}

