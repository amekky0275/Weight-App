//
//  SettingsViewController.swift
//  Weight App
//
//  Created by period2 on 12/12/18.
//  Copyright © 2018 period2. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func CoachButton(_ sender: UIButton) {
        passAlert()
    }
    
    
    func passAlert()
    {
        var numberIn = UITextField()
        var numPass = String()
        let alert = UIAlertController(title: "Enter Passcode", message: "This is still under development", preferredStyle: .alert)
        alert.addTextField { (passwordTF) in
            //            passwordTF.keyboardType = UIKeyboardType.numberPad
            passwordTF.placeholder = "password"
            numberIn = passwordTF as UITextField
            print(numPass)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let check = UIAlertAction(title: "Enter", style: .default) { (UIAlertAction) in
            print(numPass)
            numPass = numberIn.text!
            
            if numPass == "alpha773791"
            {
                print("it worked kinda :)")
                print(numPass)
                //                self.transitionVC()
                //let vc = CardMakeViewController as UIViewController
                //present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
            } else {
                print("goofy boi")
                
            }
            
        }
        
        alert.addAction(cancel)
        alert.addAction(check)
        present(alert, animated: false)
    }
    
    //    func transition(Sender: UIButton!)
    //    {
    //        let nvc: ViewController = CardMakeViewController()
    //        self.present(nvc, animated: false) {
    //            print("hello baby")
    //        }
    //
    //    }
    
    func transitionVC()
    {
        let next:CardMakeViewController = storyboard?.instantiateViewController(withIdentifier: "CardMakeViewController") as! CardMakeViewController
        self.navigationController?.pushViewController(next, animated: false)
    }



}
