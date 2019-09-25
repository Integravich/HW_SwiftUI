//
//  MyGroupsTableVC.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 14/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit
import RealmSwift

class MyGroupsTableVC: UITableViewController {

    var myGroups = [Group0]()
    var groups = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // загружаем список групп из базы Realm
        do {
            let realm = try Realm()
            let groupsFromRealm = realm.objects(Group.self)
            for group in groupsFromRealm {
                print("извлечено из базы \(group.name)")
                groups.append(group)
            }
        } catch {
            print(error)
        }
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupCell", for: indexPath) as! MyGroupsTableViewCell
        
        // Получаем группу для конкретной строки
        let group = groups[indexPath.row].name
        let imageUrl = URL(string: groups[indexPath.row].photo)!
        let imageData = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imageData)
        
        // Устанавливаем группу в надпись ячейки
        cell.myGroupCell.text = group
        cell.myGroupImage.image = image
        
        return cell
     }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        // Проверяем идентификатор, чтобы убедиться, что это нужный переход
        if segue.identifier == "addGroup" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            let groupsTableVC = segue.source as! GroupsTableVC
            // Получаем индекс выделенной ячейки
            if let indexPath = groupsTableVC.tableView.indexPathForSelectedRow {
                // Получаем группу по индексу
                let group = groupsTableVC.allGroups[indexPath.row]
                // Добавляем группу в список выбранных групп, если меня в ней еще нет
                var isNotMyGroup = true
                for currentGroup in myGroups {
                    if currentGroup.name == group.name {
                        isNotMyGroup = false
                    }
                }
                if isNotMyGroup {
                    myGroups.append(group)
                }
                // Обновляем таблицу
                tableView.reloadData()
            }
        }
    }

    // Override to support editing the table view.
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем группу из массива
            myGroups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}
