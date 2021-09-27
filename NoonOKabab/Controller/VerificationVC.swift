//
//  VerificationVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 26/08/21.
//

import UIKit
import SwiftyJSON
import DropDown

class VerificationVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var selectCountryText: UITextField!
    @IBOutlet weak var emailOrPhoneText: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    var countryList: CountryList?
    let dropDown = DropDown()
    lazy var dropDowns: [DropDown] = {
        return [
            self.dropDown
        ]
    }()
    var selectedCountryId = Int()
    var selectedCountryCode = String()
    var parameter = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectCountryText.delegate = self
        emailOrPhoneText.delegate = self
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
        requestData()
        customizeDropDown()
        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .bottom }
    }
    
    func requestData() {
        CustomLoader.shared.startAnimation()
        APIWrapper.shared.getAFRequest(url: K.WebService.countryList, completion: {
            data in
            CustomLoader.shared.stopAnimating()
            if let jsonData = data{
                do{
                    let decodeData = try jsonData.rawData()
                    let countryData = try JSONDecoder().decode(CountryData.self, from: decodeData)
                    self.countryList = countryData.data
                    if let countries = self.countryList?.countries{
                        countries.forEach{
                            self.dropDown.dataSource.append($0.name ?? "")
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    func setUpDropDown(data: [Country]?) {
        dropDown.anchorView = selectCountryText
        dropDown.bottomOffset = CGPoint(x: 0, y: selectCountryText.bounds.height)
        dropDown.selectionAction = { (index, item) in
            self.selectCountryText.text = item
            self.selectedCountryId = self.countryList?.countries?[index].id ?? 0
            self.selectedCountryCode = "\(self.countryList?.countries?[index].phonecode ?? 0)"
        }
        dropDown.show()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == selectCountryText{
            textField.resignFirstResponder()
            self.setUpDropDown(data: (self.countryList?.countries)!)
            return false
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let x = (currentText as NSString).replacingCharacters(in: range, with: string)
//        let allowedCharacters = CharacterSet(charactersIn:"0123456789.")//Here change this characters based on your requirement
//        let characterSet = CharacterSet(charactersIn: string)
        if emailOrPhoneText == textField {
            return x.count <= 30
        }
        return true
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if selectCountryText.text?.isEmpty ?? false || emailOrPhoneText.text?.isEmpty ?? false{
            
        }else{
            let alert = UIStoryboard.alertVC()
            alert.modalPresentationStyle = .overCurrentContext
            alert.delegate = self
            let isNumber = (Int(emailOrPhoneText.text ?? "0") ?? 0) != 0
            alert.emailOrPhone = "\(isNumber ? "+\(selectedCountryCode) " : "")\(emailOrPhoneText.text ?? "")"
            present(alert, animated: true, completion: {
                alert.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2989323092)
            })
        }
    }
    
    func customizeDropDown() {
        let appearance = DropDown.appearance()
        appearance.cellHeight = 40
        appearance.backgroundColor = UIColor(white: 1, alpha: 1)
        appearance.selectionBackgroundColor = #colorLiteral(red: 0.9468217492, green: 0.7342308164, blue: 0.2393384576, alpha: 0.3996661862)
        appearance.separatorColor = UIColor(white: 0.7, alpha: 0.8)
        appearance.cornerRadius = 10
        appearance.shadowColor = UIColor(white: 0.6, alpha: 1)
        appearance.shadowOpacity = 0.9
        appearance.shadowRadius = 25
        appearance.animationduration = 0.2
        appearance.textColor = .black
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            appearance.textFont = .systemFont(ofSize: 15)//UIFont(descriptor: UIFontDescriptor(name: "Poppins-Bold", size: 15), size: 15)
        default:
            appearance.textFont = .systemFont(ofSize: 17)//UIFont(descriptor: UIFontDescriptor(name: "Poppins-Bold", size: 20), size: 20)
        }
        if #available(iOS 11.0, *) {
            appearance.setupMaskedCorners([.layerMaxXMaxYCorner, .layerMinXMaxYCorner])
        }
    }
}
extension VerificationVC: AlertDelegate{
    func btnClicked(_ sender: UIButton) {
        if sender.tag == 1{
            parameter = [
                "country": "\(selectedCountryId)",
                "phone_code": selectedCountryCode,
                "global": "\(emailOrPhoneText.text!)"
            ]
            CustomLoader.shared.startAnimation()
            APIWrapper.shared.postAFRequest(params: parameter, url: K.WebService.submitUser, completion: {
                data in
                CustomLoader.shared.stopAnimating()
                if let jsonData = data{
                    print(jsonData)
                    let otpVC = UIStoryboard.otpVerificationVC()
                    otpVC.parameter = self.parameter
//                    let myNavigationController = UIApplication.shared.windows[0].rootViewController as? MyNavigationController
                    self.navigationController?.pushViewController(otpVC, animated: true)
                }
            })
        }
    }
}
