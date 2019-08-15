//
//  UserDetailViewController.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    var userViewModel: UserViewModel?
    var userId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        userViewModel?.getUser(completion: { (success) in
            if success {
                self.setData()
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        })
        
    }
    
    func setData() {
        
        name.text = userViewModel?.userModel?.name
        userName.text = userViewModel?.userModel?.username
        email.text = userViewModel?.userModel?.email
        phone.text = userViewModel?.userModel?.phone
    }
}
