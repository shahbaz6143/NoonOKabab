//
//  RootTabBarController.swift
//  Foezy
//
//  Created by Mohd Shadab on 2/18/21.
//  Copyright © 2021 ZedSS Technologies. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if AppUserData.shared.currentUser == nil{
//            if tabBarController.selectedIndex == 3{
//                let loginNavigation = storyboard?.instantiateViewController(withIdentifier: K.id.getOtpNavigation) as? SwipeNavigationController
//                loginNavigation?.isLoggedIn = false
//                tabBarController.viewControllers![tabBarController.selectedIndex] = loginNavigation!
//            }
//        }
    }
}
