//
//  UserViewModel.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation

class UserViewModel {
    
    let restClient = RestClient()
    var userModel: User?
    var dataManager = UserDataManager()
    
    init(userModel: User) {
        self.userModel = userModel
    }
    
    func getUser(completion: @escaping (Bool) -> Void) {
        dataManager.getUser(userId: userModel?.id ?? 0) { (user) in
            DispatchQueue.main.async {
                self.userModel = user
                completion(user == nil ?  false :  true)
            }
        } 
    }
}
