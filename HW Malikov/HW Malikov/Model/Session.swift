//
//  Session.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 15/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation

class Session { // Синглтон
    // Сначала сделаем конструктор приватным – это запретит создание экземпляров класса.
    private init() {}
    
    // Затем создадим в классе статическую константу с экземпляром этого же класса. Таким образом, сам класс будет хранить в себе свой же единственный объект
    static let instance = Session()
    
    var login = ""
    var password = ""
    var token = ""
    var userId = ""
    var client_id = "7138996" // id приложения
    
}




