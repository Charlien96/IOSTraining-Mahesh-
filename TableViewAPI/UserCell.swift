//
//  UserCell.swift
//  TableViewAPI
//
//  Created by Admin on 08/03/2022.
//

import UIKit

class UserCell: UITableViewCell {
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let userImgView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    let emailLbl: UILabel = {
        let email = UILabel()
        email.font = UIFont.boldSystemFont(ofSize: 20)
        email.textColor = .black
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    let firstNameLbl: UILabel = {
        let firstName = UILabel()
        firstName.font = UIFont.boldSystemFont(ofSize: 20)
        firstName.textColor = .black
        firstName.translatesAutoresizingMaskIntoConstraints = false
        return firstName
    }()
    let lastNameLbl: UILabel = {
        let lastName = UILabel()
        lastName.font = UIFont.boldSystemFont(ofSize: 20)
        lastName.textColor = .black
        lastName.translatesAutoresizingMaskIntoConstraints = false
        return lastName
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "tblViewCell")
        
        container.addSubview(userImgView)
        container.addSubview(emailLbl)
        container.addSubview(firstNameLbl)
        container.addSubview(lastNameLbl)
        self.contentView.addSubview(container)
        
        container.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        container.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        container.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        userImgView.topAnchor.constraint(equalTo:self.container.topAnchor).isActive = true
        userImgView.leadingAnchor.constraint(equalTo:self.container.leadingAnchor, constant: 10).isActive = true
        
        emailLbl.topAnchor.constraint(equalTo:self.container.topAnchor).isActive = true
        emailLbl.leadingAnchor.constraint(equalTo:self.userImgView.trailingAnchor).isActive = true
        emailLbl.trailingAnchor.constraint(equalTo:self.container.trailingAnchor).isActive = true
        
        firstNameLbl.topAnchor.constraint(equalTo:self.emailLbl.bottomAnchor).isActive = true
        firstNameLbl.leadingAnchor.constraint(equalTo:self.userImgView.trailingAnchor).isActive = true
        firstNameLbl.trailingAnchor.constraint(equalTo:self.container.trailingAnchor).isActive = true
        
        lastNameLbl.topAnchor.constraint(equalTo:self.firstNameLbl.bottomAnchor).isActive = true
        lastNameLbl.leadingAnchor.constraint(equalTo:self.userImgView.trailingAnchor).isActive = true
        lastNameLbl.trailingAnchor.constraint(equalTo:self.container.trailingAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

}
