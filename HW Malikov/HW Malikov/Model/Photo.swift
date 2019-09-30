//
//  Photo.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 25/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation
import RealmSwift

struct ResponsePhotosLevel1: Decodable {
    let response: ResponsePhotosLevel2
}

struct ResponsePhotosLevel2: Decodable {
    let count: Int
    let items: [ResponsePhotosLevel3]
}

struct ResponsePhotosLevel3: Decodable {
    let sizes: [Photo]
}

struct Photo: Decodable {
    var type: String
    var url: String
}

class WallPhotoOfUser: Object {
    @objc dynamic var userId = ""
    @objc dynamic var photoUrl = ""
}

