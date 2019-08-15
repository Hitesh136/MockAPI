//
//  ViewController.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var userListViewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userListViewModel.getUsers {[weak self] (success) in
            if success {
                self?.tableView.delegate = self
                self?.tableView.dataSource = self
                self?.tableView.reloadData()
            } else {
                self?.tableView.delegate = nil
                self?.tableView.dataSource = nil
                self?.tableView.reloadData()
            }
        }
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let userViewModel = userListViewModel.users[indexPath.row]
        cell.configureCell(user: userViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userViewModel = userListViewModel.users[indexPath.row]

        let userDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        
        userDetailViewController.userViewModel = userViewModel
        self.navigationController?.pushViewController(userDetailViewController, animated: true)
    }
}

