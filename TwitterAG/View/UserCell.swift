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
            guard let user = datasourceItem as? User else {return}
            nameLabel.text = user.name
            usernameLabel.text = user.username
            userBio.text = user.bioText
            profileImage.image = user.profileImage
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@agu3rra"
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let userBio: UITextView = {
        let textView = UITextView()
        textView.text = "I'm passionate about technology and admire the power it grants us to extend our abilities."
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = UIColor.clear // transparent
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        let twitterBlue = Colors.twitterBlue
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: UIControlState.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        // manipulates button image position
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = .white
        
        // Adds separator lines
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = Colors.separator
        
        // adds all items that will be contained in the user cell
        addSubview(nameLabel)
        addSubview(profileImage)
        addSubview(usernameLabel)
        addSubview(userBio)
        addSubview(followButton)

        // layouts for the view
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImage.topAnchor, left: profileImage.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        userBio.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: -4, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 0)
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
