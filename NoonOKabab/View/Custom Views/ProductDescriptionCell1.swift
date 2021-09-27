//
//  ProductDescriptionCell1.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 06/09/21.
//

import UIKit

class ProductDescriptionCell1: UITableViewCell {
//    @IBOutlet weak var prodNameLbl: UILabel!
    @IBOutlet weak var prodDescLbl: UILabel!
    @IBOutlet weak var qtyTypeView: RoundCornerWithBorder!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var qtyTypeLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var stepperView: RoundCornerWithBorder!
    @IBOutlet weak var minusBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
