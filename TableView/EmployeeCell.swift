//
//  EmployeeCell.swift
//  TableView
//
//  Created by Admin on 02/03/2022.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    @IBOutlet weak var fNameLbl: UILabel!
    @IBOutlet weak var lNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
