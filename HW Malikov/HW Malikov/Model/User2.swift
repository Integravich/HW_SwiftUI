//
//  User2.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 21/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object, Codable {
    @objc dynamic let id: Int
    @objc dynamic let name: String
    @objc dynamic let surname: String
    @objc dynamic let avatarPhoto: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "first_name"
        case surname = "last_name"
        case avatarPhoto = "photo_50"
    }
    
    var fullName: String {
        return name + " " + surname
    }
}

struct ResponseFriendsLevel2: Codable {
    let count: Int
    let items: [User]
}

struct ResponseFriendsLevel1: Codable {
    let responseLevel2: ResponseFriendsLevel2
    
    enum CodingKeys: String, CodingKey {
        case responseLevel2 = "response"
    }
}

