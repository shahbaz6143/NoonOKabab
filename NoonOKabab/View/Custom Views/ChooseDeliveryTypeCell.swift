//
//  ChooseDeliveryTypeCell.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 09/09/21.
//

import UIKit

class ChooseDeliveryTypeCell: UITableViewCell {
    @IBOutlet weak var deliveryTypeView: UIView!
    @IBOutlet weak var scheduleForView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var deliveryTypeLbl: UILabel!
    @IBOutlet weak var scheduleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
