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

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        // Loading users and tweets
        guard let usersJsonArray = json["users"].array,
            let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "AG.TwitterAG", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid data format in JSON."])
        }
        self.users = usersJsonArray.map({return User(json: $0)}) // $0 represents the element on each iteration of the usersJsonArray
        self.tweets = tweetsJsonArray.map({return Tweet(json: $0)})
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
