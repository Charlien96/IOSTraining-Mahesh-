//
//  ViewController.swift
//  TableView
//
//  Created by Admin on 28/02/2022.
//

import UIKit

struct Employees {
    let firstName:String
    let lastName:String
    let age:Int
    let company:String
}

class ViewController: UIViewController, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var employee:[Employees] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        populateList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblViewCell", for: indexPath) as! EmployeeCell
        cell.fNameLbl.text = "\(employee[indexPath.row].firstName)"
        cell.lNameLbl.text = "\(employee[indexPath.row].lastName)"
        cell.ageLbl.text = "\(employee[indexPath.row].age)"
        cell.companyLbl.text = "\(employee[indexPath.row].company)"
        return cell
    }
    
    func populateList() {
        let e1 = Employees(firstName:"David", lastName: "Taylor", age: 24, company: "Google")
        let e2 = Employees(firstName: "Nathan", lastName: "Kwok", age: 24, company: "Facebook")
        let e3 = Employees(firstName: "Charles", lastName: "Newman", age: 25, company: "ITC")
        let e4 = Employees(firstName: "Robert", lastName: "Ryan", age: 24, company: "Yahoo")
        let e5 = Employees(firstName: "James", lastName: "Hall", age: 39, company: "NetWatch")
        
        employee = [e1, e2, e3, e4, e5]
    }
    
}

