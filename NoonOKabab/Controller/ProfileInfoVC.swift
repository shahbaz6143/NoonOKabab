//
//  ProfileInfoVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 26/08/21.
//

import UIKit

class ProfileInfoVC: UIViewController {

    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var editProfileBTn: UIButton!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var locationTextfield: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        let otpVC = UIStoryboard.rootTabBarVC()
//        let myNavigationController = UIApplication.shared.windows[0].rootViewController as? MyNavigationController
        self.navigationController?.pushViewController(otpVC, animated: true)
    }
}
