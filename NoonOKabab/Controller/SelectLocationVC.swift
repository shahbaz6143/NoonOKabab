//
//  SelectLocationVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 09/09/21.
//

import UIKit

class SelectLocationVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var confirmBtn: RoundButton!
    @IBOutlet weak var locationLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func confirmPressed(_ sender: UIButton) {
        let otpVC = UIStoryboard.confirmAddressPopUp()
        navigationController?.pushViewController(otpVC, animated: true)
    }
}
