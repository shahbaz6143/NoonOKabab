//
//  NotificationVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 15/09/21.
//

import UIKit

class NotificationVC: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cartItemLbl: UILabel!
    @IBOutlet weak var notificationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
extension NotificationVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.notificationListCell) as! NotificationListCell
        return cell
    }
}
