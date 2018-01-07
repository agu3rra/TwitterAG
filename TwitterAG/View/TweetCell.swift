//
//  TweetCell.swift
//  TwitterAG
//
//  Created by Andre Guerra on 07/01/18.
//  Copyright © 2018 Andre Guerra. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = Colors.separator
        backgroundColor = .white
    }
}
