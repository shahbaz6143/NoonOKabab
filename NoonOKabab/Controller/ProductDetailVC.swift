//
//  ProductDetailVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 03/09/21.
//

import UIKit

class ProductDetailVC: UIViewController {

    @IBOutlet weak var cartLbl: UILabel!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var pLbl1: UILabel!
    @IBOutlet weak var pLbl2: UILabel!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var ofLbl1: UILabel!
    @IBOutlet weak var ofLbl2: UILabel!
    @IBOutlet weak var qtyTypeView: RoundCornerWithBorder!
    @IBOutlet weak var qtyTypeLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ratingLbl2: UILabel!
    @IBOutlet weak var deliveryTimeLbl: UILabel!
    @IBOutlet weak var deliveryTimeLbl2: UILabel!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var discountLbl: UILabel!
    
    var foodDetailData: FoodDetailModel?
    var foodId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getItemsData()
    }
    
    func setData() {
        guard let prodData = foodDetailData?.data else {
            return
        }
        guard let baseImgUrl = prodData.imageBaseURL else {
            return
        }
        guard let imgUrl = prodData.foodItem?.getGallery?[0].image else {
            return
        }
        productImg.sd_setImage(with: URL(string: baseImgUrl + imgUrl), placeholderImage: #imageLiteral(resourceName: "hamburger"))
        productName.text = prodData.foodItem?.name ?? ""
        titleLbl.text = prodData.foodItem?.name ?? ""
        pLbl1.text = prodData.foodItem?.getCategory?.name ?? ""
        pLbl2.text = prodData.foodItem?.foodItemDescription
        ratingLbl.text = "★4.5"
        ratingLbl2.text = "500+ Rating"
        deliveryTimeLbl.text = "59 mins"
        deliveryTimeLbl2.text = "Delivery Time"
        amountLbl.text = prodData.foodItem?.getVarients?[0].finalPrice ?? ""
        discountLbl.text = prodData.foodItem?.getVarients?[0].discount ?? ""
    }
    
    func getItemsData() {
        CustomLoader.shared.startAnimation()
        APIWrapper.shared.getAFRequest(url: K.WebService.foodDetail + "\(foodId)", completion: {
            data in
            CustomLoader.shared.stopAnimating()
            if let jsonData = data{
                print(jsonData)
                do{
                    let decodeData = try jsonData.rawData()
                    self.foodDetailData = try JSONDecoder().decode(FoodDetailModel.self, from: decodeData)
                    self.setData()
//                    self.tableView.reloadData()
                }catch{
                    
                }
            }
        })
    }
    
    func addFavouriteData() {
        CustomLoader.shared.startAnimation()
        APIWrapper.shared.getAFRequest(url: K.WebService.addFavourite + "\(foodId)", completion: {
            data in
            CustomLoader.shared.stopAnimating()
            if let jsonData = data{
                print(jsonData)
//                do{
//                    let decodeData = try jsonData.rawData()
//                    self.foodDetailData = try JSONDecoder().decode(FoodDetailModel.self, from: decodeData)
////                    self.tableView.reloadData()
//                }catch{
//
//                }
            }
        })
    }
    
    @IBAction func menuBtnPressed(_ sender: Any) {
        toggleSideMenuView()
    }
    
    @IBAction func stepperPressed(_ sender: UIButton) {
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        if sender.tag == 1{
            addFavouriteData()
        }
    }
}
