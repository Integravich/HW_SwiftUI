//
//  Group.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 14/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Group0 {
    let name: String
    let image: UIImage?
    var isMyGroup: Bool = false
    init(_ name: String, _ image: UIImage?) {
        self.name = name
        self.image = image
    }
}

class Group: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    @objc dynamic var photo: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case photo = "photo_50"
    }
}

struct ResponseGroupsLevel1: Decodable {
    let responseLevel2: ResponseGroupsLevel2
    
    enum CodingKeys: String, CodingKey {
        case responseLevel2 = "response"
    }
}

struct ResponseGroupsLevel2: Decodable {
    let count: Int
    let items: [Group]
}

func loadAllGroups() -> [Group0] {
    var arrayOfGroups: [Group0] = []
    
    let group1 = Group0("Ходьба", UIImage(named: "walking"))
    arrayOfGroups.append(group1)
    
    let group2 = Group0("Бег", UIImage(named: "running"))
    arrayOfGroups.append(group2)
    
    let group3 = Group0("Быстрый бег", UIImage(named: "running2"))
    arrayOfGroups.append(group3)
    
    let group4 = Group0("Велосипедный спорт", UIImage(named: "biking"))
    arrayOfGroups.append(group4)
    
    let group5 = Group0("Левитация", UIImage(named: "floating"))
    arrayOfGroups.append(group5)
    
    let group6 = Group0("Футбол", UIImage(named: "football"))
    arrayOfGroups.append(group6)
    
    let group7 = Group0("Медитация", UIImage(named: "meditation"))
    arrayOfGroups.append(group7)
    
    let group8 = Group0("Лыжный спорт", UIImage(named: "skiing"))
    arrayOfGroups.append(group8)
    
    let group9 = Group0("Плавание", UIImage(named: "swimming"))
    arrayOfGroups.append(group9)

    let group10 = Group0("Тяжелая атлетика", UIImage(named: "weightlift"))
    arrayOfGroups.append(group10)
    
    return arrayOfGroups
}

