//
//  FoodItemsCell.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 11/09/21.
//

import UIKit

class FoodItemsCell: UITableViewCell {
    
    @IBOutlet weak var productCategoryLbl: UILabel!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productDescriptionLbl: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var heartBtn: RoundButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
