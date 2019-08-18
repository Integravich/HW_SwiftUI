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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
