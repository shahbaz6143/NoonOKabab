//
//  ConfirmAddressPopUp.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 09/09/21.
//

import UIKit

class ConfirmAddressPopUp: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var completeAddressText: UITextField!
    @IBOutlet weak var floorText: UITextField!
    @IBOutlet weak var howToReachText: UITextField!
    @IBOutlet weak var confirmBtn: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func confirmPressed(_ sender: UIButton) {
        navigationController?.viewControllers.forEach{
            if $0 is addAddressVC{
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
