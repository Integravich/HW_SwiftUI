//
//  Group.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 14/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation

class Group {
    let name: String
    var isMyGroup: Bool = false
    init(_ name: String) {
        self.name = name
    }
}

func loadAllGroups() -> [Group] {
    var arrayOfGroups = [Group]()
    for n in 0...9 {
        arrayOfGroups.append(Group("Группа \(n)"))
    }
    return arrayOfGroups
}

