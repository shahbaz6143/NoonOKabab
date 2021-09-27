//
//  CartItemCell.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 08/09/21.
//

import UIKit

class CartItemCell: UITableViewCell {

    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var stepperView: RoundCornerWithBorder!
    @IBOutlet weak var productDescLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var amtLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
