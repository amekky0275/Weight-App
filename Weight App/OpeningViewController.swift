//
//  OpeningViewController.swift
//  Weight App
//
//  Created by period2 on 12/12/18.
//  Copyright © 2018 period2. All rights reserved.
//

import UIKit

class OpeningViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    var loggedIn = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("this means nothing delete later")
        
        loggedIn = defaults.integer(forKey: "loggedIn")
        
        if loggedIn == 0
        {
            logInAlert()
        } else {
            self.title = defaults.string(forKey: "userName")
        }
        
    }
    
    var userName = String()
    
    
    func logInAlert()
    {
        var userTf = UITextField()
        let alert = UIAlertController(title: "Log In", message: "Enter your student username (first letter of your first name + last name + last 4 digits of ID number). This can not be changed later and is important to enter correctly", preferredStyle: .alert)
        alert.addTextField { (UserTF) in
            userTf = UserTF
        }
        let confirm = UIAlertAction(title: "Yes", style: .default) { (confirm) in
            self.userName = userTf.text!
            
            self.confirmAlert()
        }
        alert.addAction(confirm)
        present(alert, animated: false)
    }
    
    func confirmAlert()
    {
        let alert = UIAlertController(title: "\(userName)", message: "Is this correct? It cant be changed later.", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Yes", style: .default) { (okButton) in
            self.title = self.userName
            self.defaults.set(1, forKey: "loggedIn")
            self.defaults.set("\(self.userName)", forKey: "userName")
        }
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(confirm)
        present(alert, animated: false)
    }

}
