//
//  LiftViewController.swift
//  Weight App
//
//  Created by period2 on 11/15/18.
//  Copyright © 2018 period2. All rights reserved.
//

import UIKit

class LiftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!
    
    // 0 = lift, 1 = profile
    var active = Int()
    
    var sport = String()
    
    var lifts = [String]()
    
    let SAMPLEallLifts = ["Cross Country" : ["Flat Bench", "Front Squats", "Push Press"], "Soccer" : ["Flat Bench", "Hang Clean", "Back Squat"], "Football" : ["Flat Bench", "Back Squat", "Hang Clean", "Dead Lift"], "Golf" : ["Lat Pull Downs", "Tri Extension", "Seated Row"], "Basketball" : ["Back Squat", "Box Jump", "Bench Press"], "Swimming/Diving" : ["Flat Bench", "Seated Row", "Back Squat"], "Wrestling" : ["Flat Bench", "Back Squat", "Hang Clean"], "BaseBall" : ["Flat Bench", "Seated Row", "Back Squat"], "Gymnastics" : ["Flat Bench", "Back Squat"], "Tennis" : ["Flat Bench", "Back Squat", "Lat Pull Downs"], "Track" : ["Hang Clean", "Power Clean", "Back Squat"], "Volleyball" : ["Back Squat", "Front Squat", "Dead Lift"], "Water Polo" : ["Flat Bench", "Seated Row", "Back Squat"] ]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        lifts = SAMPLEallLifts["\(sport)"]!
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "liftCell", for: indexPath)
        cell.textLabel!.text = lifts[indexPath.row]
        return cell
    }

}
