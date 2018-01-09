//
//  HomeDatasource.swift
//  TwitterAG
//
//  Created by Andre Guerra on 05/01/18.
//  Copyright © 2018 Andre Guerra. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] { // the use of this Generic type, eliminates the need of casting. It simply returns an object of the same type that was used to call this function.
        return try map({try T(json: $0)})
    }
}

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        // Loading users and tweets
        guard let usersJsonArray = json["users"].array,
            let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "AG.TwitterAG", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format in JSON."])
        }
//        self.users = usersJsonArray.map({return User(json: $0)}) // $0 represents the element on each iteration of the usersJsonArray
//        self.tweets = tweetsJsonArray.map({return Tweet(json: $0)})
        
        self.users = try usersJsonArray.decode()
        self.tweets = try tweetsJsonArray.decode()
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self] // just add the type of cells you need on different sections.
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    // This is where we can create separate sections of the app. In the case of twitter, a section for displaying Who to follow and another for recent Tweets.
    override func numberOfSections() -> Int {
        return 2
    }
}
