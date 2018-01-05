//
//  UserCell.swift
//  TwitterAG
//
//  Created by Andre Guerra on 05/01/18.
//  Copyright © 2018 Andre Guerra. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    /// Accesses items in the HomeDatasource
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
//        label.text = "Your name."
        label.backgroundColor = UIColor.green
        return label
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@username"
        label.backgroundColor = UIColor.purple
        return label
    }()
    
    let userBio: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.yellow
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.cyan
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        // adds all items that will be contained in the user cell
        addSubview(nameLabel)
        addSubview(profileImage)
        addSubview(usernameLabel)
        addSubview(userBio)
        addSubview(followButton)

        // layouts for the view
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImage.topAnchor, left: profileImage.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        userBio.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
