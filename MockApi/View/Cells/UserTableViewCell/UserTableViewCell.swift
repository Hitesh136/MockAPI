//
//  UserTableViewCell.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(user: UserViewModel) {
        nameLabel.text = user.userModel?.name
        userName.text = user.userModel?.username
        emailLabel.text = user.userModel?.email
        phoneLabel.text = user.userModel?.phone
    }
    
}
