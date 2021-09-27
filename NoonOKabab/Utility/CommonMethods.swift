//
//  CommonMethods.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 26/08/21.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

func setRootVC(_ vc:UIViewController!){
    let nav = UINavigationController(rootViewController: vc)
    nav.navigationBar.isHidden = true
    nav.interactivePopGestureRecognizer?.isEnabled = false
    
    if #available(iOS 13.0, *) {
        UIApplication.shared.windows.first?.rootViewController = nav
    }else{
        appDelegate?.window?.rootViewController = nav
    }
}

func rootVC() -> UIViewController{
    
    if #available(iOS 13.0, *) {
        return UIApplication.shared.windows.first?.rootViewController ?? UIViewController()
    } else {
        return appDelegate?.window?.rootViewController ?? UIViewController()
    }
}

func setGradientBackgroundButton(_ button:UIButton, _ color_top:UIColor, _ color_bottom:UIColor){
    let colorTop: UIColor = color_top
    let colorBottom: UIColor = color_bottom
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
   // (CGPoint(x: 0.0, y: 0.0), CGPoint(x: 0.0, y: 1.0))
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
    gradientLayer.frame = button.bounds
//    button.layer.sublayers?.remove(at: 0)
    button.clipsToBounds = true
    button.layer.insertSublayer(gradientLayer, at: 0)
}
func setGradientBackground(_ view:UIView, _ color_top:UIColor, _ color_bottom:UIColor, isHorizontal:Bool = true){
    if isHorizontal{
        let colorTop: UIColor = color_top
        let colorBottom: UIColor = color_bottom
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }else{
        let colorTop: UIColor = color_top
        let colorBottom: UIColor = color_bottom
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
func getBuildVer() -> String {
    let version:String = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String)!
    let build:String = (Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String)!
    
    let strBuildNo:String = "\(version)(\(build))"
    return strBuildNo
}
func validateNumbers(value: String) -> Bool {
    //let PHONE_REGEX = "^((\\+)|(00))[0-9]{6,14}$"
    let PHONE_REGEX = "^[0-9]{1,2}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
    let result =  phoneTest.evaluate(with: value)
    return result
}

//MARK: - Shahid
func verifyUrl(urlString: String?) -> Bool {
    if (urlString?.isEmpty)! {
        return false
    }
    
    if let urlString = urlString?.trimmingCharacters(in: .whitespacesAndNewlines) {
        if let url = URL(string: urlString) {
            return UIApplication.shared.canOpenURL(url)
        }
    }
    return false
}

func isValidEmailAddress(emailAddressString: String) -> Bool {
    
    if(emailAddressString.isEmpty)
    {
        return false
    }
    var returnValue = true
    let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]"//+\\.[A-Za-z]{2,3}"
    
    do {
        let regex = try NSRegularExpression(pattern: emailRegEx)
        let nsString = emailAddressString as NSString
        let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
        
        if results.count == 0
        {
            returnValue = false
        }
        
    } catch let error as NSError {
        print("invalid regex: \(error.localizedDescription)")
        returnValue = false
    }
    
    return  returnValue
}


