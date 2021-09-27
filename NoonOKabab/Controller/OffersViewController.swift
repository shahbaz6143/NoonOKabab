//
//  OffersViewController.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 11/09/21.
//

import UIKit

class OffersViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }
}
extension OffersViewController: UITableViewDelegate, UITableViewDataSource{
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.offersPomoCodeCell) as! OffersPomoCodeCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.offersListCell) as! OffersListCell
            return cell
        }
    }
}
