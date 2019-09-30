//
//  VKNetService.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 18/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import Foundation
import RealmSwift

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
            URLQueryItem(name: "fields", value: "name, photo_50"),
            URLQueryItem(name: "v", value: "5.101"),
            URLQueryItem(name: "access_token", value: session.token),
        ]
        
        // задача для запуска
        let task = VKsession.dataTask(with: urlConstructor.url!) { (data, response, error) in
            // в замыкании обрабатываем полученные данные
            do {
                let responseLevel1 = try JSONDecoder().decode(ResponseFriendsLevel1.self, from: data!)
                let users = responseLevel1.responseLevel2.items
                print("friends:")
                for user in users {
                        print(user.id)
                        print(user.name)
                        print(user.surname)
                        print(user.avatarPhoto)
                }
                // обработка исключений при работе с хранилищем
                do {
                    // получаем доступ к хранилищу
                    let realm = try Realm()
                    // начинаем изменять хранилище
                    realm.beginWrite()
                    // кладем все объекты класса в хранилище
                    realm.add(users)
                    // завершаем изменения хранилища
                    try realm.commitWrite()
                    print("Количество User в базе = \(realm.objects(User.self).count)")
                } catch {
                    // если произошла ошибка, выводим ее в консоль
                    print(error)
                }
            } catch {
                print(error)
            }
        }
        // запускаем задачу
        task.resume()
    }
    
    // получения фотографий стены пользователя
    func getWallPhotos(ofUser userId: String) {
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
        urlConstructor.path = "/method/photos.get"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "owner_id", value: userId),
            URLQueryItem(name: "album_id", value: "wall"),
            URLQueryItem(name: "v", value: "5.101"),
            URLQueryItem(name: "access_token", value: session.token),
        ]
        
        var picUrls = [String]()
        
        // задача для запуска
        let task = VKsession.dataTask(with: urlConstructor.url!) { (data, response, error) in
            // в замыкании обрабатываем полученные данные
            do {
                let responseLevel1 = try JSONDecoder().decode(ResponsePhotosLevel1.self, from: data!)
                let photoSets = responseLevel1.response.items
                print("Photos of user: \(userId)")
                for photoSet in photoSets {
                    for pic in photoSet.sizes {
                        if pic.type == "z" {
                            picUrls.append(pic.url)
                            print(pic.type + " " + pic.url)
                        }
                    }
                }
                // обработка исключений при работе с хранилищем
                do {
                    let realm = try Realm()
                    for pic in picUrls {
                        let wallPhoto = WallPhotoOfUser()
                        wallPhoto.userId = userId
                        wallPhoto.photoUrl = pic
                        
                        realm.beginWrite()
                        realm.add(wallPhoto)
                        try realm.commitWrite()
                    }
                    print("Количество wallPhotos в базе = \(realm.objects(WallPhotoOfUser.self).count)")
                } catch {
                    print(error)
                }
            } catch {
                print(error)
            }
        }
        // запускаем задачу
        task.resume()
        
    }
    
    // получение списка групп пользователя
    func getGroups(ofUserID userID: String) {
        let configuration = URLSessionConfiguration.default
        let VKsession = URLSession(configuration: configuration)
        
        // создаем конструктор для URL
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: userID),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "name, photo_50"),
            URLQueryItem(name: "v", value: "5.101"),
            URLQueryItem(name: "access_token", value: session.token),
        ]
        
        // задача для запуска
        let task = VKsession.dataTask(with: urlConstructor.url!) { (data, response, error) in
            // в замыкании обрабатываем полученные данные
                do {
                    let responseLevel1 = try JSONDecoder().decode(ResponseGroupsLevel1.self, from: data!)
                    let groups = responseLevel1.responseLevel2.items
                    print("groups:")
                    for group in groups {
                        print(group.id)
                        print(group.name)
                        print(group.photo)
                    }
                    // обработка исключений при работе с хранилищем
                    do {
                        // получаем доступ к хранилищу
                        let realm = try Realm()
                        // начинаем изменять хранилище
                        realm.beginWrite()
                        // кладем все объекты класса в хранилище
                        realm.add(groups)
                        // завершаем изменения хранилища
                        try realm.commitWrite()
                        print("Количество Group в базе = \(realm.objects(Group.self).count)")
                    } catch {
                        // если произошла ошибка, выводим ее в консоль
                        print(error)
                    }
                } catch {
                    print(error)
                }
        }
        // запускаем задачу
        task.resume()
    }
    
}
