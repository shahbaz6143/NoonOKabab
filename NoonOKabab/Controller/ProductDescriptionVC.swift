//
//  ProductDescriptionVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 06/09/21.
//

import UIKit

class ProductDescriptionVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cartLbl: UILabel!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var addToCartBtn: RoundButton!
    @IBOutlet weak var totalAmtTitle: UILabel!
    @IBOutlet weak var totalAmtValueLbl: UILabel!
    
    var noOfSection = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }
}
extension ProductDescriptionVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return noOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case noOfSection - 2:
            return 1
        case noOfSection - 1:
            return 3
        default:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.prodDescHeaderCell) as! ProdDescHeaderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.productDescriptionCell1) as! ProductDescriptionCell1
            return cell
        }else if indexPath.section == noOfSection - 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.prodDescRemarkCell) as! ProdDescRemarkCell
            return cell
        }else if indexPath.section == noOfSection - 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.prodDescItemCell) as! ProdDescItemCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.prodDescCategory) as! ProdDescCategory
            return cell
        }
    }
}
