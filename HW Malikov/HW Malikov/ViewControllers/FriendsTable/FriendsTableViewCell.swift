//
//  FriendsTableViewCell.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 13/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var avatarShadow: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // настраиваем вид аватарки
        avatarImage.layer.cornerRadius = 19 // скругляем
        avatarImage.layer.masksToBounds = true // обрезаем
        // настраиваем тень
        avatarShadow.layer.cornerRadius = 19 // скругляем
        avatarShadow.layer.shadowColor = UIColor.black.cgColor
        avatarShadow.layer.shadowOpacity = 0.5
        avatarShadow.layer.shadowRadius = 2
        avatarShadow.layer.shadowOffset = CGSize(width: 2, height: 2)
        avatarShadow.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
