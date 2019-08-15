//
//  UserDataManager.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation

class UserDataManager {
    
    let restClient = RestClient()
    
    func getUsers(completion: @escaping ([User]) ->() ) {
        let urlPath = "https://jsonplaceholder.typicode.com/users"
        restClient.request(url: urlPath, loader: true) { (data) in
            guard let userData = data else {
                completion([])
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let users = try jsonDecoder.decode([User].self, from: userData)
                completion(users)
            } catch let error {
                print(error)
                completion([])
            }
        }
    }
    
    func getUser(userId: Int, completion: @escaping (User?) -> Void) {
        let urlPath = "https://jsonplaceholder.typicode.com/users/" + String(userId)
        restClient.request(url: urlPath, loader: true) { (data) in
            guard let userData = data else {
                completion(nil)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let user = try jsonDecoder.decode(User.self, from: userData)
                completion(user)
            } catch let error {
                print(error)
                completion(nil)
            }
        }
    }
}
