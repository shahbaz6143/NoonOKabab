//
//  WelcomeViewController.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 26/08/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var continueBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func continuePressed(_ sender: UIButton) {
        let verfyVC = UIStoryboard.verificationVC()
//        let myNavigationController = UIApplication.shared.windows[0].rootViewController as? MyNavigationController
        navigationController?.pushViewController(verfyVC, animated: true)
    }
}
