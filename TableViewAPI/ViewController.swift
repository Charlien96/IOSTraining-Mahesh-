//
//  ViewController.swift
//  TableViewAPI
//
//  Created by Admin on 08/03/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    let tblView = UITableView()
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tblView.dataSource = self
        self.view.addSubview(tblView)
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
        tblView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        tblView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        tblView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0.0).isActive = true
        tblView.register(UserCell.self, forCellReuseIdentifier: "tblViewCell")
        getUsers()
        tblView.dataSource = self
        tblView.delegate = self
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
        cell.userImgView.getImage(avatar: users[indexPath.row].avatar!)
        cell.emailLbl.text = "\(users[indexPath.row].email)"
        cell.firstNameLbl.text = "\(users[indexPath.row].first_name)"
        cell.lastNameLbl.text = "\(users[indexPath.row].last_name)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }
    
}

