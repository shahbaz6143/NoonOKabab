//
//  CustomAlertVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 07/09/21.
//

import UIKit

protocol CustomAlertDelegate {
    func confirmBtnPressed(_ sender: UIButton)
}
class CustomAlertVC: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    
    var titleStr: String?
    var messageStr: String?
    var delegate: CustomAlertDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = titleStr
        messageLbl.text = messageStr
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: {
            if sender.tag == 0{
                self.delegate?.confirmBtnPressed(sender)
            }
        })
    }
}
