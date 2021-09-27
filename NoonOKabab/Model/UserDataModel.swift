//
//  UserDataModel.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 18/09/21.
//

import Foundation

// MARK: - UserDataModel
struct UserDataModel: Codable {
    let message: String?
    let code: Int?
    let status: Bool?
    var data: UserData?
}

// MARK: - UserData
struct UserData: Codable {
    var accessToken: String?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case user
    }
}

// MARK: - User
struct User: Codable {
    let stateID, address: String?
    let updatedAt: String?
    let gender, referralMasterID, name: String?
    let userStatus: String
    let website: String?
    let countryID: Int?
    let youtube: String?
    let countryCode: Int?
    let role: String?
    let cityID, emailVerifiedAt, twitter, dateOfOpen: String?
    let companyName: String?
    let receiverAmount: Int?
    let mobileNumber: String?
    let senderAmount: Int?
    let email: String?
    let id: Int?
    let phoneNumber: String?
    let receiverReferralStatus, createdAt, senderReferralStatus: String
    let deletedAt, profilePhoto, aboutMe, facebook: String?
    let dob, managerName, linkedin, maritalStatus: String?
    let referralUserID: String?
    let walletAmount: Int?
    let mobileVerifiedAt, username: String?

    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case address
        case updatedAt = "updated_at"
        case gender
        case referralMasterID = "referral_master_id"
        case name
        case userStatus = "user_status"
        case website
        case countryID = "country_id"
        case youtube
        case countryCode = "country_code"
        case role
        case cityID = "city_id"
        case emailVerifiedAt = "email_verified_at"
        case twitter
        case dateOfOpen = "date_of_open"
        case companyName = "company_name"
        case receiverAmount = "receiver_amount"
        case mobileNumber = "mobile_number"
        case senderAmount = "sender_amount"
        case email, id
        case phoneNumber = "phone_number"
        case receiverReferralStatus = "receiver_referral_status"
        case createdAt = "created_at"
        case senderReferralStatus = "sender_referral_status"
        case deletedAt = "deleted_at"
        case profilePhoto = "profile_photo"
        case aboutMe = "about_me"
        case facebook, dob
        case managerName = "manager_name"
        case linkedin
        case maritalStatus = "marital_status"
        case referralUserID = "referral_user_id"
        case walletAmount = "wallet_amount"
        case mobileVerifiedAt = "mobile_verified_at"
        case username
    }
}
