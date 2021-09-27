//
//  extension.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 24/08/21.
//

import UIKit

extension UIStoryboard{
    // MARK: Storyboard Methods
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    class func splashWithLoadingVC() -> SplashWithLoadingVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.splashWithLoadingVC) as! SplashWithLoadingVC
    }
    class func welcomeViewController() -> WelcomeViewController{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.welcomeViewController) as! WelcomeViewController
    }
    class func verificationVC() -> VerificationVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.verificationVC) as! VerificationVC
    }
    class func otpVerificationVC() -> OTPVerificationVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.otpVerificationVC) as! OTPVerificationVC
    }
    class func successVC() -> SuccessVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.successVC) as! SuccessVC
    }
    class func profileInfoVC() -> ProfileInfoVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.profileInfoVC) as! ProfileInfoVC
    }
    class func rootTabBarVC() -> RootTabBarController{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.rootTabBarController) as! RootTabBarController
    }
    class func productDetailVC() -> ProductDetailVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.productDetailVC) as! ProductDetailVC
    }
    class func productDescriptionVC() -> ProductDescriptionVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.productDescriptionVC) as! ProductDescriptionVC
    }
    class func alertVC() -> AlertVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.alertVC) as! AlertVC
    }
    class func sideMenuVC() -> SideMenuVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.sideMenuVC) as! SideMenuVC
    }
    class func customAlertVC() -> CustomAlertVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.customAlertVC) as! CustomAlertVC
    }
    class func foodItemsListVC() -> FoodItemsVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.customAlertVC) as! FoodItemsVC
    }
    class func viewCartVC() -> ViewCartVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.viewCartVC) as! ViewCartVC
    }
    class func addAddressVC() -> addAddressVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.addAddressVC) as! addAddressVC
    }
    class func checkoutVC() -> CheckoutVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.checkoutVC) as! CheckoutVC
    }
    class func selectLocationVC() -> SelectLocationVC{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.selectLocationVC) as! SelectLocationVC
    }
    class func confirmAddressPopUp() -> ConfirmAddressPopUp{
        return mainStoryboard().instantiateViewController(withIdentifier: K.storyboardId.confirmAddressPopUp) as! ConfirmAddressPopUp
    }
}

extension UIViewController{
    @objc func popToPrevious(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

@IBDesignable class RoundView: UIView {
   // MARK: - Properties
   @IBInspectable var cornerRadius: CGFloat = 0.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowColor: UIColor = UIColor.darkGray {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowOffsetWidth: CGFloat = 0.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowOffsetHeight: CGFloat = 1.8 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowOpacity: Float = 0.30 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowRadius: CGFloat = 5.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable  var topLeft: Bool = true {
      didSet {
        setNeedsLayout()
      }
   }
   @IBInspectable  var topRight: Bool = true {
      didSet {
        setNeedsLayout()
      }
   }
   @IBInspectable  var bottomLeft: Bool = true {
      didSet {
        setNeedsLayout()
      }
   }
   @IBInspectable  var bottomRight: Bool = true {
      didSet {
        setNeedsLayout()
      }
   }
   @IBInspectable  var roundAllCorners: Bool = false {
      didSet {
        setNeedsLayout()
      }
   }
   private var shadowLayer: CAShapeLayer = CAShapeLayer() {
      didSet {
         setNeedsLayout()
      }
   }
   override func layoutSubviews() {
      super.layoutSubviews()
      var roundCorners = UIRectCorner()
    if topLeft {
        roundCorners =  roundCorners.union(.topLeft)
    }
    if topRight {
        roundCorners =  roundCorners.union(.topRight)
    }
    if bottomLeft {
        roundCorners =  roundCorners.union(.bottomLeft)
    }
    if bottomRight {
        roundCorners =  roundCorners.union(.bottomRight)
    }
    if roundAllCorners{
        roundCorners = [.allCorners]
    }
      layer.cornerRadius = cornerRadius
      shadowLayer.path = UIBezierPath(roundedRect: bounds,byRoundingCorners: roundCorners,cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
      shadowLayer.fillColor = backgroundColor?.cgColor
      shadowLayer.shadowColor = shadowColor.cgColor
      shadowLayer.shadowPath = shadowLayer.path
      shadowLayer.shadowOffset = CGSize(width: shadowOffsetWidth,
         height: shadowOffsetHeight)
      shadowLayer.shadowOpacity = shadowOpacity
      shadowLayer.shadowRadius = shadowRadius
      layer.insertSublayer(shadowLayer, at: 0)
   }
}

@IBDesignable class RoundButton: UIButton {
   // MARK: - Properties
   @IBInspectable var cornerRadius: CGFloat = 0.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowColor: UIColor = UIColor.darkGray {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowOffsetWidth: CGFloat = 0.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowOffsetHeight: CGFloat = 1.8 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowOpacity: Float = 0.30 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var shadowRadius: CGFloat = 3.0 {
      didSet {
         setNeedsLayout()
      }
   }
   private var shadowLayer: CAShapeLayer = CAShapeLayer() {
      didSet {
         setNeedsLayout()
      }
   }
   override func layoutSubviews() {
      super.layoutSubviews()
      layer.cornerRadius = cornerRadius
      shadowLayer.path = UIBezierPath(roundedRect: bounds,
         cornerRadius: cornerRadius).cgPath
      shadowLayer.fillColor = backgroundColor?.cgColor
      shadowLayer.shadowColor = shadowColor.cgColor
      shadowLayer.shadowPath = shadowLayer.path
      shadowLayer.shadowOffset = CGSize(width: shadowOffsetWidth,
         height: shadowOffsetHeight)
      shadowLayer.shadowOpacity = shadowOpacity
      shadowLayer.shadowRadius = shadowRadius
      layer.insertSublayer(shadowLayer, at: 0)
   }
}

@IBDesignable class RoundLabel: UILabel {
   // MARK: - Properties
    @IBInspectable var lblCornerRadius: CGFloat = 11.25 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var lblShadowColor: UIColor = UIColor.darkGray {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var lblShadowOffsetWidth: CGFloat = 0.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var lblShadowOffsetHeight: CGFloat = 1.8 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var lblShadowOpacity: Float = 0.30 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var lblShadowRadius: CGFloat = 3.0 {
      didSet {
         setNeedsLayout()
      }
   }
   private var shadowLayer: CAShapeLayer = CAShapeLayer() {
      didSet {
         setNeedsLayout()
      }
   }
   override func layoutSubviews() {
      super.layoutSubviews()
//      lblCornerRadius = self.bounds.height/2
      layer.cornerRadius = lblCornerRadius
      shadowLayer.path = UIBezierPath(roundedRect: bounds,
         cornerRadius: lblCornerRadius).cgPath
      shadowLayer.fillColor = backgroundColor?.cgColor
      shadowLayer.shadowColor = lblShadowColor.cgColor
      shadowLayer.shadowPath = shadowLayer.path
      shadowLayer.shadowOffset = CGSize(width: lblShadowOffsetWidth,
         height: lblShadowOffsetHeight)
      shadowLayer.shadowOpacity = lblShadowOpacity
      shadowLayer.shadowRadius = lblShadowRadius
      layer.insertSublayer(shadowLayer, at: 0)
   }
}

@IBDesignable class RoundTextField: UITextField {
   // MARK: - Properties
    @IBInspectable var textFieldCornerRadius: CGFloat = 11.25 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var textFieldShadowColor: UIColor = UIColor.darkGray {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var textFieldShadowOffsetWidth: CGFloat = 0.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var textFieldShadowOffsetHeight: CGFloat = 1.8 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var textFieldShadowOpacity: Float = 0.30 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var textFieldShadowRadius: CGFloat = 3.0 {
      didSet {
         setNeedsLayout()
      }
   }
   private var shadowLayer: CAShapeLayer = CAShapeLayer() {
      didSet {
         setNeedsLayout()
      }
   }
   override func layoutSubviews() {
      super.layoutSubviews()
//      lblCornerRadius = self.bounds.height/2
      layer.cornerRadius = textFieldCornerRadius
//      shadowLayer.path = UIBezierPath(roundedRect: bounds,
//         cornerRadius: cornerRadius).cgPath
//      shadowLayer.fillColor = backgroundColor?.cgColor
//      shadowLayer.shadowColor = lblShadowColor.cgColor
//      shadowLayer.shadowPath = shadowLayer.path
//      shadowLayer.shadowOffset = CGSize(width: shadowOffsetWidth,
//         height: shadowOffsetHeight)
//      shadowLayer.shadowOpacity = shadowOpacity
//      shadowLayer.shadowRadius = shadowRadius
//      layer.insertSublayer(shadowLayer, at: 0)
   }
}




@IBDesignable class RoundImageView: UIImageView {
   // MARK: - Properties
   @IBInspectable var imageCornerRadius: CGFloat = 20.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var imageShadowColor: UIColor = UIColor.darkGray {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var imageShadowOffsetWidth: CGFloat = 0.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var imageShadowOffsetHeight: CGFloat = 1.8 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var imageShadowOpacity: Float = 0.30 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var imageShadowRadius: CGFloat = 3.0 {
      didSet {
         setNeedsLayout()
      }
   }
   private var shadowLayer: CAShapeLayer = CAShapeLayer() {
      didSet {
         setNeedsLayout()
      }
   }
   override func layoutSubviews() {
      super.layoutSubviews()
//      imageCornerRadius = self.bounds.height/2
      layer.cornerRadius = imageCornerRadius
//      shadowLayer.path = UIBezierPath(roundedRect: bounds,
//         cornerRadius: cornerRadius).cgPath
//      shadowLayer.fillColor = backgroundColor?.cgColor
//      shadowLayer.shadowColor = imageShadowColor.cgColor
//      shadowLayer.shadowPath = shadowLayer.path
//      shadowLayer.shadowOffset = CGSize(width: imageShadowOffsetWidth,
//         height: imageShadowOffsetHeight)
//      shadowLayer.shadowOpacity = imageShadowOpacity
//      shadowLayer.shadowRadius = imageShadowRadius
//      layer.insertSublayer(shadowLayer, at: 0)
   }
}


@IBDesignable class RoundCornerWithBorder: UIView {
   // MARK: - Properties
   @IBInspectable var cornerRadius: CGFloat = 5.0 {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) {
      didSet {
         setNeedsLayout()
      }
   }
   @IBInspectable var borderWidth: CGFloat = 1.0 {
      didSet {
         setNeedsLayout()
      }
   }
   private var shadowLayer: CAShapeLayer = CAShapeLayer() {
      didSet {
         setNeedsLayout()
      }
   }
   override func layoutSubviews() {
      super.layoutSubviews()
      layer.cornerRadius = self.cornerRadius
      layer.borderColor = self.borderColor.cgColor
      layer.borderWidth = self.borderWidth
   }
}
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.windows.last?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
