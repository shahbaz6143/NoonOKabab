//
//  AlertVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 26/08/21.
//

import UIKit

protocol AlertDelegate {
    func btnClicked(_ sender: UIButton)
}
class AlertVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var mobileNmbrTitle: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var editBTn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    var delegate: AlertDelegate?
    
    var emailOrPhone = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mobileNmbrTitle.text = emailOrPhone
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {_ in
//            self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2989323092)
//        })
        
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        if sender == okBtn{
            dismiss(animated: false, completion: {
                self.delegate?.btnClicked(sender)
            })
        }else{
            dismiss(animated: true, completion: nil)
        }
    }
}
