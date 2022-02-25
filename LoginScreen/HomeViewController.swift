//
//  HomeViewController.swift
//  LoginScreen
//
//  Created by Admin on 25/02/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabbel: UILabel!
    var userName:String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabbel.text?.append(userName)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
