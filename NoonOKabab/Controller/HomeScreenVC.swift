//
//  HomeScreenVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 28/08/21.
//

import UIKit
import SDWebImage

class HomeScreenVC: UIViewController {

    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var noOfItemsLbl: RoundLabel!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewCartBtn: UIButton!
    @IBOutlet weak var itemLbl: UILabel!
    @IBOutlet weak var totalAmtLbl: UILabel!
    @IBOutlet weak var taxesLbl: UILabel!
    
    var categoriesData: DashboardModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: K.cellId.productListCell, bundle: nil), forCellReuseIdentifier: K.cellId.productListCell)
        menuBtn.addTarget(self, action: #selector(menuBtnTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.getCategories()

    }
    @objc func menuBtnTapped(_ sender: UIButton) {
//        sideMenuController().toggleLeftView(animated: true)
    }
    @IBAction func viewCartPressed(_ sender: UIButton) {
        let otpVC = UIStoryboard.viewCartVC()
        navigationController?.pushViewController(otpVC, animated: true)
    }
    
    func getCategories() {
        CustomLoader.shared.startAnimation()
        
        APIWrapper.shared.getAFWithHeaderRequest(url: K.WebService.categoriesData, completion: {
            data in
            CustomLoader.shared.stopAnimating()
            if let jsonData = data{
                print(jsonData)
                do{
                    let decodeData = try jsonData.rawData()
                    self.categoriesData = try JSONDecoder().decode(DashboardModel.self, from: decodeData)
                    self.tableView.reloadData()
                }catch{
                    print("error---",error.localizedDescription)
                }
            }
            self.tableView.delegate = self
            self.tableView.dataSource = self
        })

    }
    
}
extension HomeScreenVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesData?.data?.foodItems?.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.homePageDetailCell) as? HomePageDetailCell else { return UITableViewCell() }
            cell.categoriesData(categoriesModel: categoriesData!)
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellId.productListCell) as? ProductListCell else { return UITableViewCell() }
            cell.productName.text = categoriesData?.data?.foodItems![indexPath.row].name
            cell.productPrice.text = categoriesData?.data?.foodItems![indexPath.row].getSinglePrice?.price
            cell.productDiscount.text = "\(String(describing: categoriesData?.data?.foodItems![indexPath.row].getSinglePrice?.discount))"
            cell.productDescription.text = categoriesData?.data?.foodItems![indexPath.row].foodItemDescription
            let imageUrl = (categoriesData?.data?.imageBaseURL)! + (categoriesData?.data?.foodItems![indexPath.row].getGallery![0].image ?? "")!
            cell.productImage.sd_setImage(with: URL(string: imageUrl ), placeholderImage: UIImage())

            cell.addBtn.addTarget(self, action: #selector(addBtnPressed(_:)), for: .touchUpInside)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 0{
            let otpVC = UIStoryboard.productDetailVC()
            navigationController?.pushViewController(otpVC, animated: true)
        }
    }
    
    @objc func addBtnPressed(_ sender: UIButton) {
        let otpVC = UIStoryboard.productDescriptionVC()
        navigationController?.pushViewController(otpVC, animated: true)
    }
}
