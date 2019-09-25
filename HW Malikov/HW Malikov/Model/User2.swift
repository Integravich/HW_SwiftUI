//
//  User2.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 21/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation
import RealmSwift

// Класс Realm немногим отличается от обычного. Во-первых, он наследуется от класса Object. Во-вторых, обычные свойства должны быть помечены ключевым словом @objc dynamic.
class User: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var surname: String
    @objc dynamic var avatarPhoto: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "first_name"
        case surname = "last_name"
        case avatarPhoto = "photo_50"
    }
    
    var fullname: String {
        get {
            return surname + " " + name
        }
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

