//
//  SideMenuTableViewCell.swift
//  Shopify
//
//  Created by Omnie on 5/6/19.
//  Copyright © 2019 Omnie. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
@IBOutlet weak var menuTitleLbl: UILabel!
@IBOutlet weak var iconImgView: UIImageView!
//@IBOutlet weak var badgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
//        badgeLabel.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
