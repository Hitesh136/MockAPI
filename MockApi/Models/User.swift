//
//  User.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation

struct User : Codable {

    let email : String?
    let id : Int?
    let name : String?
    let phone : String?
    let username : String?
    let website : String?
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case id = "id"
        case name = "name"
        case phone = "phone"
        case username = "username"
        case website = "website"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        website = try values.decodeIfPresent(String.self, forKey: .website)
    }
    
}
