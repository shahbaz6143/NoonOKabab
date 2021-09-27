//
//  MyNavigationController.swift
//  SwiftSideMenu
//
//  Created by Evgeny Nazarov on 30.09.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit

class MyNavigationController: ENSideMenuNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "SideMenuVC")
        self.view.backgroundColor = .clear
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: vc, menuPosition:.left)
        sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = self.view.frame.width // optional, default is 160
        sideMenu?.bouncingEnabled = false
        sideMenu?.allowRightSwipe = false
        
        //sideMenu?.allowPanGesture = false
        // make navigation bar showing over side menu
        //view.bringSubview(toFront: navigationBar)
//        switchController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyNavigationController: ENSideMenuDelegate {
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        return true
    }
}
