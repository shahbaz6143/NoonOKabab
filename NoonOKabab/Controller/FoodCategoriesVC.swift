//
//  FoodCategoriesVC.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 13/09/21.
//

import UIKit
import SDWebImage

class FoodCategoriesVC: UIViewController {

    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var searchView: RoundView!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var foodCategoriesList: DashboardData?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.getFoodCategories()
        collectionView.delegate = self
        collectionView.dataSource = self
        backBtn.addTarget(self, action: #selector(popToPrevious(_:)), for: .touchUpInside)
    }

    
    func getFoodCategories() {
        CustomLoader.shared.startAnimation()
        APIWrapper.shared.getAFRequest(url: K.WebService.categoryList ,completion: {
            data in
            CustomLoader.shared.stopAnimating()
            if let jsonData = data{
                print(jsonData)
                do{
                    let decodeData = try jsonData.rawData()
                    self.foodCategoriesList = try JSONDecoder().decode(DashboardData.self, from: decodeData)
                    self.collectionView.reloadData()
                }catch{
                    print("error---",error.localizedDescription)
                }
            }
        })

    }
}
extension FoodCategoriesVC: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodCategoriesList?.categories?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2 - 10, height: self.collectionView.frame.width/2 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.cellId.foodCategoryCell, for: indexPath) as! FoodCategoryCell
        cell.foodCatName.text = foodCategoriesList?.categories![indexPath.row].name
        let imageUrl = (foodCategoriesList?.imageBaseURL)! + (foodCategoriesList?.categories![indexPath.row].image)!
        cell.foodCatImage.sd_setImage(with: URL(string: imageUrl ), placeholderImage: UIImage())

        return cell
    }
}
