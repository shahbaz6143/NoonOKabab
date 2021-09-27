//
//  ViewCartVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 08/09/21.
//

import UIKit

class ViewCartVC: UIViewController {

    @IBOutlet weak var grandTotalAmt: UILabel!
    @IBOutlet weak var payNowBtn: UIButton!
    @IBOutlet weak var grandTotalTitle: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var noOfRows = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }
    
    func payNowPressed(_ sender: UIButton) {
        let otpVC = UIStoryboard.addAddressVC()
        navigationController?.pushViewController(otpVC, animated: true)
    }
}
extension ViewCartVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.deliveryAddressCell) as! DeliveryAddressCell
            return cell
        case noOfRows-4:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.cartAddOnCell) as! CartAddOnCell
            return cell
        case noOfRows-3:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.cartOfferLblCell) as! CartOfferLblCell
            return cell
        case noOfRows-2:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.cartPriceDetailCell) as! CartPriceDetailCell
            return cell
        case noOfRows-1:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.promoCodeCell) as! PromoCodeCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.cartItemCell) as! CartItemCell
            return cell
        }
        
    }
}
