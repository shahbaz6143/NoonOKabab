//
//  FoodItemsVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 10/09/21.
//

import UIKit
import SwiftyJSON
import SDWebImage

class FoodItemsVC: UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var cartItemLbl: UILabel!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var filterBtn: RoundButton!
    @IBOutlet weak var searchView: RoundView!
    @IBOutlet weak var tableView: UITableView!
    
    var foodList: FoodItemsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
        getItemsData()
    }
    @objc func likePressed(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    func getItemsData() {
        let parameter = [
            "search": searchText.text!
        ]
        CustomLoader.shared.startAnimation()
        APIWrapper.shared.postAFRequest(params: parameter, url: K.WebService.foodItemsList, completion: {
            data in
            CustomLoader.shared.stopAnimating()
            if let jsonData = data{
                print(jsonData)
                do{
                    let decodeData = try jsonData.rawData()
                    self.foodList = try JSONDecoder().decode(FoodItemsModel.self, from: decodeData)
                    self.tableView.reloadData()
                }catch{
                    print("error-----",error.localizedDescription)
                }
            }
        })
    }
}

extension FoodItemsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let foodData = foodList else {
            return 0
        }
        return foodData.data?.foodItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.foodItemsCell) as! FoodItemsCell
        cell.heartBtn.addTarget(self, action: #selector(likePressed(_:)), for: .touchUpInside)
        guard let fList = foodList else {
            return cell
        }
        guard let fData = fList.data else {
            return cell
        }
        let foodData = fData.foodItems?[indexPath.row]
        let imgUrl = foodData!.getGallery![0].image ?? ""
        cell.productImg.sd_setImage(with: URL(string: fData.imageBaseURL ?? "" + imgUrl), placeholderImage: #imageLiteral(resourceName: "hamburger"))
        cell.productNameLbl.text = foodData?.name
        cell.productCategoryLbl.text = foodData?.foodItemDescription
        cell.productDescriptionLbl.text = foodData?.remark
        cell.amountLbl.text = foodData?.getSinglePrice!.price
        return cell
    }
}
