//
//  HomeDatasource.swift
//  TwitterAG
//
//  Created by Andre Guerra on 05/01/18.
//  Copyright © 2018 Andre Guerra. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let andre = User(name: "Andre Guerra", username: "@agu3rra", bioText: "Father. Knowledge seeker. Engineer. Self taught programmer. Yoga enthusiast. Runner.", profileImage: #imageLiteral(resourceName: "profile_image") )
        let elon = User(name: "Elon Musk", username: "@elonmusk", bioText: "Real life Ironman. I will take humans to all corners of the galaxy.", profileImage: #imageLiteral(resourceName: "elon_musk"))
        let brian = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iOS Developer, Instructor", profileImage: #imageLiteral(resourceName: "brian_voong"))
        return [andre, elon, brian]
    }()
    
    let tweets: [Tweet] = {
        let andre = User(name: "Andre Guerra", username: "@agu3rra", bioText: "Father. Knowledge seeker. Engineer. Self taught programmer. Yoga enthusiast. Runner.", profileImage: #imageLiteral(resourceName: "profile_image") )
        let tweet1 = Tweet(user: andre, message: "This is supposed to be a long text for a demo of how a tweet message is supposed to be rendered in this app.")
        let tweet2 = Tweet(user: andre, message: "Yet another message I just have to keep writing text to. The point here is to have some text to return to our app view.")
        return [tweet1, tweet2]
    }()
    
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
