//
//  ProductListCell.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 27/08/21.
//

import UIKit

class ProductListCell: UITableViewCell {

    @IBOutlet weak var productDiscount: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var addBtn: RoundButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
