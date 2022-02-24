//
//  ViewController.swift
//  LoginScreen
//
//  Created by Admin on 24/02/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBAction func loginBtn(_ sender: Any) {
        if userName.text == "UserName" && password.text == "Password" {
            print("Login successful")
        }
        else {
            print("Login unsuccessful")
        }
    }
}

