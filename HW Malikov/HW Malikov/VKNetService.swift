//
//  VKNetService.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 18/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation

class VKNetService {
    
    let session = Session.instance // наш синглтон
    
    // получение списка друзей
    func getFriends() {
        
        // Конфигурация по умолчанию
        let configuration = URLSessionConfiguration.default
        // собственная сессия
        let VKsession = URLSession(configuration: configuration)
        
        // создаем конструктор для URL
        var urlConstructor = URLComponents()
        // устанавливаем схему
        urlConstructor.scheme = "https"
        // устанавливаем хост
        urlConstructor.host = "api.vk.com"
        // путь
        urlConstructor.path = "/method/friends.get"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "client_id", value: session.client_id), // id моего приложения VK
            URLQueryItem(name: "v", value: "5.68"),
            URLQueryItem(name: "access_token", value: session.token),
        ]
        
        // задача для запуска
        let task = VKsession.dataTask(with: urlConstructor.url!) { (data, response, error) in
            // в замыкании данные, полученные от сервера, мы преобразуем в json
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            // выводим в консоль
            print("friends:")
            if let json = json {
                print(json)
            }
        }
        // запускаем задачу
        task.resume()
    }
    
}
