//
//  AppDelegate.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 24/08/21.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
//        switchController()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

//    func switchController()  {
//        let userData = UserDefaults.standard.data(forKey: K.UserDefaultKeys.userData)
//        if let uData = userData{
//            do{
//                let userData = try JSONDecoder().decode(UserDataModel.self, from: uData)
//                AppUserData.shared.currentUser = userData
//                
////                let home = UIStoryboard.welcomeViewController()
////                let homeNavigation = UINavigationController(rootViewController: home)
//                
////                let leftViewController: SideMenuVC = UIStoryboard.sideMenuVC()
////
////                let controller = LGSideMenuController.init(rootViewController: homeNavigation, leftViewController: leftViewController, rightViewController: nil)
////                controller.leftViewWidth = controller.view.frame.size.width - 80
////
////                homeNavigation.navigationBar.isHidden = true
////                window?.rootViewController = controller
////                window?.makeKeyAndVisible()
//                
//                let home = UIStoryboard.rootTabBarVC()
////                let homeNavigation = UINavigationController(rootViewController: home)
//
//                let leftViewController: SideMenuVC = UIStoryboard.sideMenuVC()
//
//                let controller = LGSideMenuController.init(rootViewController: home, leftViewController: leftViewController, rightViewController: nil)
//                controller.leftViewWidth = controller.view.frame.size.width - 80
//
////                home.navigationBar.isHidden = true
//                window?.rootViewController = controller
//                window?.makeKeyAndVisible()
//
////                window!.rootViewController = otpVC
////                let myNavigationController = UIApplication.shared.windows[0].rootViewController as? MyNavigationController
////                myNavigationController?.navigationController?.viewControllers[0] = otpVC
//                
////                window?.makeKeyAndVisible()
//            }catch{
//                let home = UIStoryboard.welcomeViewController()
//                let homeNavigation = UINavigationController(rootViewController: home)
//                
//                let leftViewController: SideMenuVC = UIStoryboard.sideMenuVC()
//                
//                let controller = LGSideMenuController.init(rootViewController: homeNavigation, leftViewController: leftViewController, rightViewController: nil)
//                controller.leftViewWidth = controller.view.frame.size.width - 80
//                
//                homeNavigation.navigationBar.isHidden = true
//                window?.rootViewController = controller
//                window?.makeKeyAndVisible()
//            }
//        }else{
//            let home = UIStoryboard.welcomeViewController()
//            let homeNavigation = UINavigationController(rootViewController: home)
//            
//            let leftViewController: SideMenuVC = UIStoryboard.sideMenuVC()
//            
//            let controller = LGSideMenuController.init(rootViewController: homeNavigation, leftViewController: leftViewController, rightViewController: nil)
//            controller.leftViewWidth = controller.view.frame.size.width - 80
//            
//            homeNavigation.navigationBar.isHidden = true
//            window?.rootViewController = controller
//            window?.makeKeyAndVisible()
//        }
//    }
}

