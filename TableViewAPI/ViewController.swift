//
//  ViewController.swift
//  TableViewAPI
//
//  Created by Admin on 08/03/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tblView: UITableView!
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tblView.dataSource = self
        getUsers()
        tblView.dataSource = self
    }
    
    func getUsers() {
        let session = URLSession.shared
        let urlString = "https://reqres.in/api/users"
        let url = URL(string: urlString)!
        
        let dataTask = session.dataTask(with: url) { data, responce, error in
            do {
                let decodedResponce = try JSONDecoder().decode(UserResponce.self, from: data!)
                
                self.users = decodedResponce.data
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblViewCell", for: indexPath) as! UserCell
        cell.idLbl.text = "\(users[indexPath.row].id)"
        cell.emailLbl.text = "\(users[indexPath.row].email)"
        cell.firstNameLbl.text = "\(users[indexPath.row].first_name)"
        cell.lastNameLbl.text = "\(users[indexPath.row].last_name)"
        return cell
    }
    
}

