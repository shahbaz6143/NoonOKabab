//
//  addAddressVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 09/09/21.
//

import UIKit

class addAddressVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }
}
extension addAddressVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.headerCell) as! HeaderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.addAddressBtnCell) as! AddAddressBtnCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.addressListCell) as! AddressListCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0{
            let otpVC = UIStoryboard.checkoutVC()
            navigationController?.pushViewController(otpVC, animated: true)
        }else{
            let otpVC = UIStoryboard.selectLocationVC()
            navigationController?.pushViewController(otpVC, animated: true)
        }
    }
}
