//
//  Constants.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 24/08/21.
//

import Foundation

struct K {
    static let appName = "Noon O Kabab"
    static let eng = "eng"
    
    struct storyboardId {
        static let rootTabBarController = "RootTabBarController"
        static let splashWithLoadingVC = "SplashWithLoadingVC"
        static let welcomeViewController = "WelcomeViewController"
        static let verificationVC = "VerificationVC"
        static let alertVC = "AlertVC"
        static let otpVerificationVC = "OTPVerificationVC"
        static let successVC = "SuccessVC"
        static let sideMenuVC = "SideMenuVC"
        static let profileInfoVC = "ProfileInfoVC"
        static let homeScreenVC = "HomeScreenVC"
        static let productDetailVC = "ProductDetailVC"
        static let productDescriptionVC = "ProductDescriptionVC"
        static let customAlertVC = "CustomAlertVC"
        static let viewCartVC = "ViewCartVC"
        static let checkoutVC = "CheckoutVC"
        static let addAddressVC = "addAddressVC"
        static let selectLocationVC = "SelectLocationVC"
        static let confirmAddressPopUp = "ConfirmAddressPopUp"
        static let addCardVC = "addCardVC"
        static let foodItemsVC = "FoodItemsVC"
        static let offersViewController = "OffersViewController"
        static let foodCategoriesVC = "FoodCategoriesVC"
        static let notificationVC = "NotificationVC"
    }
    
    struct cellId {
        static let productListCell = "ProductListCell"
        static let homeCategoryCell = "HomeCategoryCell"
        static let homePageDetailCell = "HomePageDetailCell"
        static let prodDescCategory = "ProdDescCategory"
        static let productDescriptionCell1 = "ProductDescriptionCell1"
        static let prodDescRemarkCell = "ProdDescRemarkCell"
        static let prodDescItemCell = "ProdDescItemCell"
        static let cartPriceDetailCell = "CartPriceDetailCell"
        static let cartAddOnCell = "CartAddOnCell"
        static let cartItemCell = "CartItemCell"
        static let deliveryAddressCell = "DeliveryAddressCell"
        static let promoCodeCell = "PromoCodeCell"
        static let cartOfferLblCell = "CartOfferLblCell"
        static let prodDescHeaderCell = "ProdDescHeaderCell"
        static let addAddressBtnCell = "AddAddressBtnCell"
        static let headerCell = "HeaderCell"
        static let addressListCell = "AddressListCell"
        static let restaurentDetailCell = "RestaurentDetailCell"
        static let chooseDeliveryTypeCell = "ChooseDeliveryTypeCell"
        static let chooseCardCell = "ChooseCardCell"
        static let foodItemsCell = "FoodItemsCell"
        static let offersPomoCodeCell = "OffersPomoCodeCell"
        static let offersListCell = "OffersListCell"
        static let foodCategoryCell = "FoodCategoryCell"
        static let notificationListCell = "NotificationListCell"
    }
    struct NetworkConstants {
        static let baseURLPath = "https://miraclesaba.xyz/restaurant/api/"
    }
    
    
    struct WebService {
        static let countryList = NetworkConstants.baseURLPath + "countries"
        static let contAndReg = NetworkConstants.baseURLPath + "home/agree/continue"
        static let logout = NetworkConstants.baseURLPath + "user/logout"
        static let submitUser = NetworkConstants.baseURLPath + "user/create"
        static let submitOTP = NetworkConstants.baseURLPath + "user/verify/otp"
        static let foodItemsList = NetworkConstants.baseURLPath + "all/food-items"
        static let foodDetail = NetworkConstants.baseURLPath + "food-item/detail/"
        static let addFavourite = NetworkConstants.baseURLPath + "user/add/favourite/"
        static let categoryList = NetworkConstants.baseURLPath + "all/categories/"
        static let favouriteFoods = NetworkConstants.baseURLPath + "user/my/favourite/foods"
        static let userCard = NetworkConstants.baseURLPath + "user/card"
        
        static let categoriesData = NetworkConstants.baseURLPath + "user/dashboard"
    }
    
    struct UserDefaultKeys {
        static let userData = "userData"
        static let introSlide = "Intro"
        static let cartData = "cartData"
        static let noOfCartItem = "noOfCartItem"
        static var selectedLang = "eng"
        static let selectedAdd = "selectedAdd"
        static let lat = "lat"
        static let lon = "lon"
    }
    
    struct LabelStringsEng {
        static let description = "Description"
        static let vatTax = "All Price include VAT"
        static let shopOurCat = "Shop Our Categories"
        static let topBrands = "Top Brands"
        static let topDescriptionStrip = "Add 400 Sar of orders to get delivery free"
        static let noInternetMessage = "Please check your internet connection."
    }
}
