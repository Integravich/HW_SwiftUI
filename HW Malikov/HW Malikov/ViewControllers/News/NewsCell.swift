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
    @IBOutlet weak var newsUserAvatarShadow: UIView!
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var heartControl: HeartControl!
    @IBOutlet weak var heartLabel: UILabel!
    var heartCount = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        heartControl.addTarget(self, action: #selector(touchedUpInside), for: UIControl.Event.touchUpInside)
        
        // чтобы ячейка не выбиралась
        self.selectionStyle = .none
        
        // настраиваем вид аватарки
        newsUserAvatar.layer.cornerRadius = 19 // скругляем
        newsUserAvatar.layer.masksToBounds = true // обрезаем
        // настраиваем тень
        newsUserAvatarShadow.layer.cornerRadius = 19 // скругляем
        newsUserAvatarShadow.layer.shadowColor = UIColor.black.cgColor
        newsUserAvatarShadow.layer.shadowOpacity = 0.5
        newsUserAvatarShadow.layer.shadowRadius = 2
        newsUserAvatarShadow.layer.shadowOffset = CGSize(width: 2, height: 2)
        newsUserAvatarShadow.layer.masksToBounds = false
    }
    
    @objc func touchedUpInside() {
        heartCount += 1
        heartLabel.text = String(heartCount)
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
