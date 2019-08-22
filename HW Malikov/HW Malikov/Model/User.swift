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
        return name + " " + surname
    }
    var photoSet = [UIImage]()
    
    init(_ name: String, _ surname: String) {
        self.name = name
        self.surname = surname
    }
}

func loadFriends() -> [User] {
    var arrayOfFriends = [User]()
    
    arrayOfFriends.append(User("Василий", "Краснов"))
    arrayOfFriends[0].photoSet.append(UIImage(named: "manFPRed")!)
    arrayOfFriends[0].photoSet.append(UIImage(named: "manFPRed")!)
    arrayOfFriends[0].photoSet.append(UIImage(named: "manFPRed")!)
    
    arrayOfFriends.append(User("Павел", "Оранжевов"))
    arrayOfFriends[1].photoSet.append(UIImage(named: "manFPOrange")!)
    arrayOfFriends[1].photoSet.append(UIImage(named: "manFPOrange")!)
    
    arrayOfFriends.append(User("Сергей", "Желтов"))
    arrayOfFriends[2].photoSet.append(UIImage(named: "manFPYellow")!)
    
    arrayOfFriends.append(User("Максим", "Зеленов"))
    arrayOfFriends[3].photoSet.append(UIImage(named: "manFPGreen")!)
    
    arrayOfFriends.append(User("Алексей", "Голубов"))
    arrayOfFriends[4].photoSet.append(UIImage(named: "manFPLightBlue")!)
    
    arrayOfFriends.append(User("Александр", "Синев"))
    arrayOfFriends[5].photoSet.append(UIImage(named: "manFPBlue")!)
    
    arrayOfFriends.append(User("Евгений", "Фиолетовов"))
    arrayOfFriends[6].photoSet.append(UIImage(named: "manFPViolet")!)
    
    return arrayOfFriends
}

