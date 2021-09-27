//
//  CountryListModel.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 31/08/21.
//

import UIKit

struct CountryData: Codable {
    let message: String?
    let status: Bool?
    let data: CountryList?
}

// MARK: - DataClass
struct CountryList: Codable {
    let countries: [Country]?
}

// MARK: - Country
struct Country: Codable {
    let phonecode: Int?
    let code: String?
    let createdAt: String?
    let id: Int?
    let name: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case phonecode, code
        case createdAt = "created_at"
        case id, name
        case updatedAt = "updated_at"
    }
}
