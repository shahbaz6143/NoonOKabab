//
//  HomePageDetailCell.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 30/08/21.
//

import UIKit
import SDWebImage

class HomePageDetailCell: UITableViewCell {

    @IBOutlet weak var wishUserLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var filterBtn: RoundButton!
    @IBOutlet weak var searchFoodText: UITextField!
    @IBOutlet weak var moreFoodItemBtn: UIButton!
    @IBOutlet weak var exploreFoodItemsLbl: UILabel!
    @IBOutlet weak var moreCategoriesBtn: UIButton!
    @IBOutlet weak var exploreCategoriesLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var catModel: DashboardModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: K.cellId.homeCategoryCell, bundle: nil), forCellWithReuseIdentifier: K.cellId.homeCategoryCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func categoriesData(categoriesModel: DashboardModel) {
    
        self.catModel = categoriesModel

    }
    
}
extension HomePageDetailCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catModel?.data?.categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.cellId.homeCategoryCell, for: indexPath) as? HomeCategoryCell else {
            return UICollectionViewCell()
        }
        cell.catName.text = catModel?.data?.categories![indexPath.row].name
        let imgurl = (catModel?.data?.imageBaseURL)! + (catModel?.data?.categories![indexPath.row].image)!
        cell.imgView.sd_setImage(with: URL(string: imgurl ), placeholderImage: UIImage())
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
}
