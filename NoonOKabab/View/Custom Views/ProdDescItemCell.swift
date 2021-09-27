//
//  ProdDescItemCell.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 06/09/21.
//

import UIKit

class ProdDescItemCell: UITableViewCell {

    @IBOutlet weak var prodNameLbl: UILabel!
    @IBOutlet weak var prodImg: UIImageView!
    @IBOutlet weak var toggleBtnView: UIView!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var stepperView: RoundCornerWithBorder!
    @IBOutlet weak var prodPriceLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
