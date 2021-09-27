//
//  DashboardDataModel.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 22/09/21.
//

import Foundation

// MARK: - Welcome
struct DashboardModel: Codable {
    let status: Bool?
    let code: Int?
    let message: String?
    let data: DashboardData?
}

// MARK: - DataClass
struct DashboardData: Codable {
    let imageBaseURL: String?
    let categories: [GetCategory]?
    let foodItems: [FoodItem]?
    let userInfo: User?

    enum CodingKeys: String, CodingKey {
        case imageBaseURL = "image_base_url"
        case categories
        case foodItems = "food_items"
        case userInfo = "user_info"
    }
}

