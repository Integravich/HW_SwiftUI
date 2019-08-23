//
//  User.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 14/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation
import UIKit

class User {
    let name: String
    let surname: String
    var fullName: String {
        return surname + " " + name
    }
    var photoSet = [UIImage?]()
    
    init(_ name: String, _ surname: String) {
        self.name = name
        self.surname = surname
    }
    init(name: String, surname: String, photoset: [UIImage?]) {
        self.name = name
        self.surname = surname
        self.photoSet = photoset
    }
}

func loadFriends() -> [User] {
    var arrayOfFriends = [User]()
    
    let User1 = User(name: "Василий",
                     surname: "Краснов",
                     photoset: [UIImage(named: "manFPRed")])
    arrayOfFriends.append(User1)
    
    let User2 = User(name: "Павел",
                     surname: "Оранжевов",
                     photoset: [UIImage(named: "manFPOrange")])
    arrayOfFriends.append(User2)

    let User3 = User(name: "Сергей",
                     surname: "Желтов",
                     photoset: [UIImage(named: "manFPYellow")])
    arrayOfFriends.append(User3)
    
    let User4 = User(name: "Максим",
                     surname: "Зеленов",
                     photoset: [UIImage(named: "manFPGreen")])
    arrayOfFriends.append(User4)

    let User5 = User(name: "Алексей",
                     surname: "Голубов",
                     photoset: [UIImage(named: "manFPLightBlue")])
    arrayOfFriends.append(User5)
    
    let User6 = User(name: "Александр",
                     surname: "Синев",
                     photoset: [UIImage(named: "manFPBlue")])
    arrayOfFriends.append(User6)
    
    let User7 = User(name: "Евгений",
                     surname: "Фиолетовов",
                     photoset: [UIImage(named: "manFPViolet")])
    arrayOfFriends.append(User7)
    
    return arrayOfFriends
}

