//
//  User.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 14/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation

class User {
    let name: String
    let surname: String
    var fullName: String {
        return name + " " + surname
    }
    
    init(_ name: String, _ surname: String) {
        self.name = name
        self.surname = surname
    }
}

func loadFriends() -> [User] {
    var arrayOfFriends = [User]()
    arrayOfFriends.append(User("Василий", "Краснов"))
    arrayOfFriends.append(User("Павел", "Оранжевов"))
    arrayOfFriends.append(User("Сергей", "Желтов"))
    arrayOfFriends.append(User("Максим", "Зеленов"))
    arrayOfFriends.append(User("Алексей", "Голубов"))
    arrayOfFriends.append(User("Александр", "Синев"))
    arrayOfFriends.append(User("Евгений", "Фиолетовов"))
    return arrayOfFriends
}

