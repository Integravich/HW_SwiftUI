//
//  Group.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 14/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation
import UIKit

class Group {
    let name: String
    let image: UIImage?
    var isMyGroup: Bool = false
    init(_ name: String, _ image: UIImage?) {
        self.name = name
        self.image = image
    }
}

func loadAllGroups() -> [Group] {
    var arrayOfGroups: [Group] = []
    
    let group1 = Group("Ходьба", UIImage(named: "walking"))
    arrayOfGroups.append(group1)
    
    let group2 = Group("Бег", UIImage(named: "running"))
    arrayOfGroups.append(group2)
    
    let group3 = Group("Быстрый бег", UIImage(named: "running2"))
    arrayOfGroups.append(group3)
    
    let group4 = Group("Велосипедный спорт", UIImage(named: "biking"))
    arrayOfGroups.append(group4)
    
    let group5 = Group("Левитация", UIImage(named: "floating"))
    arrayOfGroups.append(group5)
    
    let group6 = Group("Футбол", UIImage(named: "football"))
    arrayOfGroups.append(group6)
    
    let group7 = Group("Медитация", UIImage(named: "meditation"))
    arrayOfGroups.append(group7)
    
    let group8 = Group("Лыжный спорт", UIImage(named: "skiing"))
    arrayOfGroups.append(group8)
    
    let group9 = Group("Плавание", UIImage(named: "swimming"))
    arrayOfGroups.append(group9)

    let group10 = Group("Тяжелая атлетика", UIImage(named: "weightlift"))
    arrayOfGroups.append(group10)
    
    return arrayOfGroups
}
