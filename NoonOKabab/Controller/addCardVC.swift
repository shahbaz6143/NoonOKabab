//
//  addCardVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 09/09/21.
//

import UIKit

class addCardVC: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var cardNumberText: UITextField!
    @IBOutlet weak var expiryDateText: UITextField!
    @IBOutlet weak var addCardBtn: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }

}
