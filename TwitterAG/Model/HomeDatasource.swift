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
    
    override func item(_ indexPath: IndexPath) -> Any? {
//        return self.objects?[indexPath.item]
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
}
