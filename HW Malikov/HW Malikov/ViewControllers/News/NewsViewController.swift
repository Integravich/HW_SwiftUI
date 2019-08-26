//
//  NewsViewController.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 25/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var news: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        news.append(News(newsUser: "Краснов Василий", newsUserAvatar: UIImage(named: "manFPRed"), newsDate: "25.08.19", newsText: "Скандалы, интриги, расследования", newsImage: UIImage(named: "news1")))
        
        // регистрируем ячейку
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        
        // высота ячейки
        self.tableView.rowHeight = 350
        
        self.tableView.dataSource = self
    }
    

    

//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
