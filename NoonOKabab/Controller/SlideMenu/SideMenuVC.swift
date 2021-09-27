//
//  SideMenuVC.swift
//
//

import UIKit

enum MenuOptions {
    //Sales Person
    static let Dashboard = "Dashboard"
    static let Notifications = "Notifications"
    static let OrderHistory = "Order History"
    static let Favourites = "Favourites"
    static let Account = "Account"
    static let AddressBook = "Address Book"
    static let Payments = "Payments"
    static let HowItWork = "How it work"
    static let ContactSupport = "Contact support"
    static let sendFeedback = "Send feedback"
    static let Legal = "Legal"
}

class SideMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedMenuItem : Int = 0
    var countMessage : Int = 0
    @IBOutlet weak var logedInView: UIView!
    @IBOutlet weak var sideMenuTable: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    
    var arrMenuOptions = [String]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrMenuOptions = [MenuOptions.AddressBook,MenuOptions.HowItWork,MenuOptions.ContactSupport,MenuOptions.sendFeedback,MenuOptions.Legal,MenuOptions.Payments,MenuOptions.Notifications]
        logoutBtn.addTarget(self, action: #selector(startLogout(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMenuOptions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "SideMenuTableViewCell"
        let cell:SideMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! SideMenuTableViewCell
        let aOption = arrMenuOptions[indexPath.row]
        cell.menuTitleLbl.text = aOption
//        cell.badge.isHidden = true
//        cell.badgeLabel.layer.cornerRadius = cell.badgeLabel.frame.size.height/2
        switch aOption {
        case MenuOptions.Payments:
            cell.iconImgView.image = #imageLiteral(resourceName: "hamburger")
        case MenuOptions.AddressBook:
            cell.iconImgView.image = #imageLiteral(resourceName: "hamburger")
        case MenuOptions.HowItWork:
            cell.iconImgView.image = #imageLiteral(resourceName: "hamburger")
        case MenuOptions.ContactSupport:
            cell.iconImgView.image = #imageLiteral(resourceName: "hamburger")
        case MenuOptions.sendFeedback:
            cell.iconImgView.image = #imageLiteral(resourceName: "hamburger")
        case MenuOptions.Legal:
            cell.iconImgView.image = #imageLiteral(resourceName: "hamburger")
        case MenuOptions.Notifications:
            cell.iconImgView.image = #imageLiteral(resourceName: "hamburger")
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle tap events
        toggleSideMenuView()
//        let myNavigationController = UIApplication.shared.windows[0].rootViewController as? MyNavigationController
        let aOption = arrMenuOptions[indexPath.row]
        switch aOption {
        case MenuOptions.sendFeedback:
            break;
        case MenuOptions.AddressBook:
            break
        case MenuOptions.Payments:
            break
        case MenuOptions.HowItWork:
            break
        case MenuOptions.ContactSupport:
            break
        case MenuOptions.Legal:
            break
        case MenuOptions.Notifications:
            break
        default:
            break
        }
    }
    @objc func startLogout(_ sender: UIButton) {
//        toggleSideMenuView()
        let otpVC = UIStoryboard.customAlertVC()
        otpVC.delegate = self
        otpVC.titleStr = "LOGOUT CONFIRMATION"
        otpVC.messageStr = "Are you sure you want to logout?"
        otpVC.modalPresentationStyle = .overCurrentContext
        self.present(otpVC, animated: false, completion: {
            otpVC.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2521065213)
        })
    }
    func logOutRequest() {
        APIWrapper.shared.getAFWithHeaderRequest(url: K.WebService.logout, completion: {
            data in
            if let _ = data{
                let successVC = UIStoryboard.successVC()
                successVC.delegate = self
                successVC.modalPresentationStyle = .overCurrentContext
                self.present(successVC, animated: false, completion: nil)
            }
        })
    }
}
extension SideMenuVC: CustomAlertDelegate,SuccessVCDelegate{
    func dismissSuccessVC() {
        let profileInfo = UIStoryboard.profileInfoVC()
        self.navigationController?.pushViewController(profileInfo, animated: true)
    }
    func confirmBtnPressed(_ sender: UIButton) {
        logOutRequest()
    }
}
