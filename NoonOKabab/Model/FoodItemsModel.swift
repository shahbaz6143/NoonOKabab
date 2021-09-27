//
//  FoodItemsModel.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 18/09/21.
//

import Foundation

// MARK: - Welcome
struct FoodItemsModel: Codable {
    let status: Bool?
    let message: String?
    let data: FoodData?
}

// MARK: - DataClass
struct FoodData: Codable {
    let imageBaseURL: String?
    let foodItems: [FoodItem]?

    enum CodingKeys: String, CodingKey {
        case imageBaseURL = "image_base_url"
        case foodItems = "food_items"
    }
}

// MARK: - FoodItem
struct FoodItem: Codable {
    let id, typeID, categoryID: Int?
    let subCategoryID: Int?
    let name, slug, remark, metaTitle: String?
    let keyword, foodItemDescription, stock, inventory: String?
    let cod, homeDelivery, takeaway, status: String?
    let favourite: String?
    let deliveryTime, promotional: String?
    let levels, ingredients, addons, mandatory: String?
    let createdAt, updatedAt: String?
    let deletedAt: String?
    let getGallery: [GetGallery]?
    let getSinglePrice: GetSinglePrice?
    let getVarients: [GetVarient]?
    let getCategory: GetCategory?
    let getSubCategory: GetCategory?
    
    enum CodingKeys: String, CodingKey {
        case id
        case typeID = "type_id"
        case categoryID = "category_id"
        case subCategoryID = "sub_category_id"
        case name, slug, remark
        case metaTitle = "meta_title"
        case keyword
        case foodItemDescription = "description"
        case stock, inventory, cod
        case homeDelivery = "home_delivery"
        case takeaway, status, favourite
        case deliveryTime = "delivery_time"
        case promotional, levels, ingredients, addons, mandatory
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
        case getGallery = "get_gallery"
        case getSinglePrice = "get_single_price"
        case getVarients = "get_varients"
        case getCategory = "get_category"
        case getSubCategory = "get_sub_category"
    }
}

// MARK: - GetGallery
struct GetGallery: Codable {
    let id, foodID: Int?
    let image, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case foodID = "food_id"
        case image
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - GetSinglePrice
struct GetSinglePrice: Codable {
    let id: Int?
    let name: String?
    let foodID, quantityID: Int?
    let price: String?
    let discount: Double?
    let finalPrice, stockQuantity, addon: String?
    let getSinglePriceRequired, requiredPrice: Double?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case foodID = "food_id"
        case quantityID = "quantity_id"
        case price, discount
        case finalPrice = "final_price"
        case stockQuantity = "stock_quantity"
        case addon
        case getSinglePriceRequired = "required"
        case requiredPrice = "required_price"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - GetCategory
struct GetCategory: Codable {
    let id: Int?
    let parentID: String?
    let image, name, slug, remark: String?
    let metaTitle, metaKeywords, metaDescription, status: String?
    let typeID: Int?
    let createdAt, updatedAt: String?
    let deletedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case parentID = "parent_id"
        case image, name, slug, remark
        case metaTitle = "meta_title"
        case metaKeywords = "meta_keywords"
        case metaDescription = "meta_Description"
        case status
        case typeID = "type_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deletedAt = "deleted_at"
    }
}

// MARK: - GetVarient
struct GetVarient: Codable {
    let id: Int?
    let name: String?
    let foodID, quantityID: Int?
    let price: String?
    let discount: String?
    let finalPrice, stockQuantity, addon: String?
    let getVarientRequired, requiredPrice: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case foodID = "food_id"
        case quantityID = "quantity_id"
        case price, discount
        case finalPrice = "final_price"
        case stockQuantity = "stock_quantity"
        case addon
        case getVarientRequired = "required"
        case requiredPrice = "required_price"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct FoodDetailModel: Codable {
    let status: Bool?
    let message: String?
    let data: FoodDetailData?
}

struct FoodDetailData: Codable {
    let imageBaseURL: String?
    let foodItem: FoodItem?

    enum CodingKeys: String, CodingKey {
        case imageBaseURL = "image_base_url"
        case foodItem = "food_detail"
    }
}
