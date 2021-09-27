//
//  OTPVerificationVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 26/08/21.
//

import UIKit

class OTPVerificationVC: UIViewController {

    @IBOutlet weak var otpDetailLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    @IBOutlet weak var text5: UITextField!
    @IBOutlet weak var text6: UITextField!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var timerLbl: UILabel!
    
    var count = 0
    var parameter = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textArr = [text1,text2,text3,text4,text5,text6]
        textArr.forEach{
            $0?.delegate = self
        }
        text1.becomeFirstResponder()
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: {_ in
            self.count += 1
            self.timerLbl.text = "Fetching code in \(self.count) sec"
        })
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }

    @IBAction func doneBtnPressed(_ sender: UIButton) {
        
        let params = [
            "otp": "\(text1.text ?? "")\(text2.text ?? "")\(text3.text ?? "")\(text4.text ?? "")\(text5.text ?? "")\(text6.text ?? "")"
        ] as [String: Any]
        CustomLoader.shared.startAnimation()
        APIWrapper.shared.postAFRequest(params: params, url: K.WebService.submitOTP, completion: {
            data in
            CustomLoader.shared.stopAnimating()
            if let jsonData = data{
                print(jsonData)
                
                do{
                    let decodeData = try jsonData.rawData()
                    let userData = try JSONDecoder().decode(UserDataModel.self, from: decodeData)
                    let encoder = JSONEncoder()
                    let encoded = try encoder.encode(userData)
                    let defaults = UserDefaults.standard
                    defaults.set(encoded, forKey: K.UserDefaultKeys.userData)
                    AppUserData.shared.currentUser = userData
//                    AppUserData.shared.currentUser?.data?.accessToken = (userData.data?.accessToken)! as String
                    let successVC = UIStoryboard.successVC()
                    successVC.delegate = self
                    successVC.modalPresentationStyle = .overCurrentContext
                    self.present(successVC, animated: false, completion: nil)
                }catch{
                    print("error with otp---",error.localizedDescription)
                }
            }
        })
    }
    
    @IBAction func resendBtnClicked(_ sender: UIButton) {
        text1.text = ""
        text2.text = ""
        text3.text = ""
        text4.text = ""
        text5.text = ""
        text6.text = ""
        CustomLoader.shared.startAnimation()
        APIWrapper.shared.postAFRequest(params: parameter, url: K.WebService.submitUser, completion: {
            data in
            CustomLoader.shared.stopAnimating()
            if let jsonData = data{
                print(jsonData)
                let otpVC = UIStoryboard.otpVerificationVC()
                otpVC.parameter = self.parameter
//                let myNavigationController = UIApplication.shared.windows[0].rootViewController as? MyNavigationController
                self.navigationController?.pushViewController(otpVC, animated: true)
            }
        })
    }
}
extension OTPVerificationVC: UITextFieldDelegate,SuccessVCDelegate{
    func dismissSuccessVC() {
        let profileInfo = UIStoryboard.profileInfoVC()
        self.navigationController?.pushViewController(profileInfo, animated: true)
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if ((textField.text?.count)! < 1) && (string.count > 0){
            if textField == text1{
                text2?.becomeFirstResponder()
                
            }
            if textField == text2{
                text3?.becomeFirstResponder()
            }
            if textField == text3{
                text4?.becomeFirstResponder()
            }
            if textField == text4{
                text5?.becomeFirstResponder()
            }
            if textField == text5{
                text6?.becomeFirstResponder()
            }
            if textField == text6{
                text6?.resignFirstResponder()
            }

            textField.text? = string
            return false
        }
        if  (string.count == 0){
            if textField == text1{
                text1?.becomeFirstResponder()
                
            }
            if textField == text2{
                text1?.becomeFirstResponder()
            }
            if textField == text3{
                text2?.becomeFirstResponder()
            }
            if textField == text4{
                text3?.becomeFirstResponder()
            }
            if textField == text5{
                text4?.becomeFirstResponder()
            }
            if textField == text6{
                text5?.becomeFirstResponder()
            }
            textField.text? = string
            return false
        }
            
        else if (string.count) == 1{
            textField.text = string
            return false
        }
        return true
    }
}
