//
//  SuccessVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 26/08/21.
//

import UIKit

protocol SuccessVCDelegate {
    func dismissSuccessVC()
}

class SuccessVC: UIViewController {

    var delegate: SuccessVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: {_ in
            self.dismiss(animated: false, completion: {
                self.delegate?.dismissSuccessVC()
            })
        })
    }
}
