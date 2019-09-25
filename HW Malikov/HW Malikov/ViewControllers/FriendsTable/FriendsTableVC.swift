//
//  FriendsTableVC.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 13/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit
import RealmSwift

class FriendsTableVC: UITableViewController {
    
    var users = [User]()
    let netService = VKNetService()
    let session = Session.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // загружаем друзей из базы Realm
        do {
            let realm = try Realm()
            let usersFromRealm = realm.objects(User.self)
            for user in usersFromRealm {
                print("извлечено из базы \(user.fullname)")
                users.append(user)
            }
        } catch {
            print(error)
        }
        
        // загружаем фотографии стены пользователя
        //netService.getWallPhotos(ofUserID: session.userId)
        
        // загружаем группы пользователя
        //netService.getGroups(ofUserID: session.userId)

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула и приводим к нашему типу
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsTableViewCell
        
        // Получаем друга для конкретной строки
        let friend = users[indexPath.row].fullname
        let imageUrl = URL(string: users[indexPath.row].avatarPhoto)!
        let imageData = try! Data(contentsOf: imageUrl)
        let friendPhoto = UIImage(data: imageData)
        
        // Устанавливаем друга в надпись ячейки
        cell.friendName.text = friend
        cell.avatarImage.image = friendPhoto

        return cell
    }
    
    // передаем друга на следующий экран
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToPhoto" {
            let nextScene = segue.destination as? FriendsCollectionVC
            let indexPath = self.tableView.indexPathForSelectedRow
            let selectedFriend = users[indexPath!.row]
            nextScene!.currentFriend = selectedFriend
        }
    }

}
