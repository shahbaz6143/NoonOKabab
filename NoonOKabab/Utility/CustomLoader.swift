//
//  CustomLoader.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 31/08/21.
//

import UIKit
import NVActivityIndicatorView

class CustomLoader: UIView {
    
    static let shared = CustomLoader()
    
    var nvActivityIndicator: NVActivityIndicatorView?
    var viewColor: UIColor = .black
    var setAlpha: CGFloat = 0.5
    
    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        transparentView.backgroundColor = viewColor.withAlphaComponent(setAlpha)
        transparentView.isUserInteractionEnabled = false
        return transparentView
    }()
    
    func startAnimation() {
        if let topController = UIApplication.topViewController(){
            topController.view.isUserInteractionEnabled = false
            topController.tabBarController?.tabBar.isUserInteractionEnabled = false
        }
        nvActivityIndicator = NVActivityIndicatorView(frame: .zero, type: .ballSpinFadeLoader, color: .orange, padding: 0)
        nvActivityIndicator!.translatesAutoresizingMaskIntoConstraints = false
        self.transparentView.isUserInteractionEnabled = false
        nvActivityIndicator!.isUserInteractionEnabled = false
        self.superview?.isUserInteractionEnabled = false
        self.addSubview(self.transparentView)
        self.transparentView.addSubview(nvActivityIndicator!)
        UIApplication.shared.windows.last!.addSubview(transparentView)
        NSLayoutConstraint.activate([
            nvActivityIndicator!.widthAnchor.constraint(equalToConstant: 60),
            nvActivityIndicator!.heightAnchor.constraint(equalToConstant: 60),
            nvActivityIndicator!.centerYAnchor.constraint(equalTo: self.transparentView.centerYAnchor),
            nvActivityIndicator!.centerXAnchor.constraint(equalTo: self.transparentView.centerXAnchor)
        ])
        nvActivityIndicator?.startAnimating()
    }
    
    func stopAnimating() {
        if let topController = UIApplication.topViewController(){
            topController.view.isUserInteractionEnabled = true
            topController.tabBarController?.tabBar.isUserInteractionEnabled = true
        }
        self.superview?.isUserInteractionEnabled = true
        self.transparentView.isUserInteractionEnabled = true
//        self.isUserInteractionEnabled = true
        nvActivityIndicator!.isUserInteractionEnabled = true
        nvActivityIndicator?.stopAnimating()
        self.transparentView.removeFromSuperview()
    }
}
