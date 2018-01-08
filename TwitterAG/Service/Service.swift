//
//  Service.swift
//  TwitterAG
//
//  Created by Andre Guerra on 08/01/18.
//  Copyright © 2018 Andre Guerra. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

// Singleton implementation - one unique instance across the entire application
struct Service {
    public static let sharedInstance = Service()
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON error.")
        }
    }
    
    public func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()){
        // Start JSON fetch
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("twitter/home")// this is my first use of Generics
        
        request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource)
        }) { (error) in
            print("Failed to fetch JSON.", error)
        }
    }
    

}
