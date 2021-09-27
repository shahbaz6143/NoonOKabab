//
//  DeliveryAddressCell.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 08/09/21.
//

import UIKit

class DeliveryAddressCell: UITableViewCell {

    @IBOutlet weak var arrowImgIcon: UIImageView!
    @IBOutlet weak var deliveryAddLbl: UILabel!
    @IBOutlet weak var locationIconImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
