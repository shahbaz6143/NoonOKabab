//
//  CheckoutVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 09/09/21.
//

import UIKit

class CheckoutVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var grandTotalTitleLbl: UILabel!
    @IBOutlet weak var payNowBtn: UIButton!
    @IBOutlet weak var totalAmtLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }
}
extension CheckoutVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2:
            return 1
        case 3:
            return 2
        case 4:
            return 2
        default:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0,2:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.deliveryAddressCell) as! DeliveryAddressCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.chooseDeliveryTypeCell) as! ChooseDeliveryTypeCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.restaurentDetailCell) as! RestaurentDetailCell
            return cell
        case 4:
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.cartPriceDetailCell) as! CartPriceDetailCell
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.promoCodeCell) as! PromoCodeCell
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.chooseCardCell) as! ChooseCardCell
            return cell
        }
    }
}
