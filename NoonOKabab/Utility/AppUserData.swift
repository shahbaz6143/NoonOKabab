//
//  AppUserData.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 18/09/21.
//

import UIKit

class AppUserData: NSObject {
    
    static let shared = AppUserData()
    var currentUser: UserDataModel?
    
    private override init() {
    }
//    func logout() {
//        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
//    }
}
