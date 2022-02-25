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

    @IBOutlet weak var userNameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBAction func loginBtn(_ sender: Any) {
        if userNameTxt.text == "UserName" && passwordTxt.text == "Password" {
            print("Login successful")
            performSegue(withIdentifier: "homeSegue", sender: nil)
        }
        else {
            print("Login unsuccessful")
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeViewController = segue.destination as! HomeViewController
        homeViewController.userName = userNameTxt.text ?? "nil"
    }
}

