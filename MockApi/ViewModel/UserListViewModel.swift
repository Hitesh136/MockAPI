//
//  UserListViewModel.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation

class UserListViewModel {
    
    var users = [UserViewModel]()
    var dataManager = UserDataManager()
    
    func getUsers(completion: @escaping (Bool) -> Void) {
        dataManager.getUsers { (users) in
            DispatchQueue.main.async {
                self.users = users.map{ UserViewModel(userModel: $0) }
                completion(users.isEmpty ? false : true)                
            }
        }
    }
}
