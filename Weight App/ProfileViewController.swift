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
    
    let oneRepMax = [String: Int]()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oneRepMax.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        let index = indexPath.row
        return cell
    }
    

}
