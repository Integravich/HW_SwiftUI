//
//  User.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 14/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation
import UIKit

class User0 {
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

func loadFriends() -> [User0] {
    var arrayOfFriends = [User0]()
    
    let user1 = User0(name: "Василий",
                     surname: "Краснов",
                     photoset: [UIImage(named: "manFPRed")])
    // для эксперимента добавим еще немного фотографий
    for i in 1...20 {
        user1.photoSet.append(UIImage(named: String(i)))
    }
    arrayOfFriends.append(user1)
    
    let user2 = User0(name: "Павел",
                     surname: "Оранжевов",
                     photoset: [UIImage(named: "manFPOrange")])
    arrayOfFriends.append(user2)

    let user3 = User0(name: "Сергей",
                     surname: "Желтов",
                     photoset: [UIImage(named: "manFPYellow")])
    arrayOfFriends.append(user3)
    
    let user4 = User0(name: "Максим",
                     surname: "Зеленов",
                     photoset: [UIImage(named: "manFPGreen")])
    arrayOfFriends.append(user4)

    let user5 = User0(name: "Алексей",
                     surname: "Голубов",
                     photoset: [UIImage(named: "manFPLightBlue")])
    arrayOfFriends.append(user5)
    
    let user6 = User0(name: "Александр",
                     surname: "Синев",
                     photoset: [UIImage(named: "manFPBlue")])
    arrayOfFriends.append(user6)
    
    let user7 = User0(name: "Евгений",
                     surname: "Фиолетовов",
                     photoset: [UIImage(named: "manFPViolet")])
    arrayOfFriends.append(user7)
    
    return arrayOfFriends
}

