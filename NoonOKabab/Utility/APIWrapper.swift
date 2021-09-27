//
//  APIWrapper.swift
//  NoonOKabab
//
//  Created by Mohd Shadab on 30/08/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIWrapper: NSObject {
    static let shared = APIWrapper()
    
    func getAFRequest(url: String,completion:@escaping ((JSON?)->Void)) {
        Alamofire.request(url).responseJSON{
            response in
            switch response.result{
            case .success:
                let jsonData = JSON(response.result.value!)
                completion(jsonData)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func getAFWithHeaderRequest(url: String,completion:@escaping ((JSON?)->Void)) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + (AppUserData.shared.currentUser?.data?.accessToken)! as String ,
            "Accept": "application/json"
        ]
        Alamofire.request(url, headers: headers).responseJSON{
            response in
            switch response.result{
            case .success:
                let jsonData = JSON(response.result.value!)
                completion(jsonData)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func postAFRequest(params: [String: Any],url: String,completion:@escaping ((JSON?)->Void)) {
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil) .responseJSON{
            response in
            switch response.result{
            case .success:
                let jsonData = JSON(response.result.value!)
                completion(jsonData)
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
                
            }
        }
    }
}
