//
//  UIViewController+UITableViewDataSource.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 25/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit

// хороший пример разделения кода - extension отдельно
extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        cell.setupNewsCell(news[indexPath.row])
        return cell
    }

}



