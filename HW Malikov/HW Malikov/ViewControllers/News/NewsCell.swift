//
//  NewsCell.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 25/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsUserLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var newsUserAvatar: UIImageView!
    @IBOutlet weak var newsImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // чтобы ячейка не выбиралась
        self.selectionStyle = .none
        
        // настраиваем вид аватарки
        newsUserAvatar.layer.cornerRadius = 19 // скругляем
        newsUserAvatar.layer.masksToBounds = true // обрезаем
        // настраиваем тень
//        newsUserShadow.layer.cornerRadius = 19 // скругляем
//        newsUserShadow.layer.shadowColor = UIColor.black.cgColor
//        newsUserShadow.layer.shadowOpacity = 0.5
//        newsUserShadow.layer.shadowRadius = 2
//        newsUserShadow.layer.shadowOffset = CGSize(width: 2, height: 2)
//        newsUserShadow.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupNewsCell(_ news: News) {
        self.newsUserLabel.text = news.newsUser
        self.newsUserAvatar.image = news.newsUserAvatar
        self.newsDateLabel.text = news.newsDate
        self.newsTextLabel.text = news.newsText
        self.newsImage.image = news.newsImage
    }
    
}
