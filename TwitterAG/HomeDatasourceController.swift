//
//  HomeDatasourceController.swift
//  TwitterAG
//
//  Created by Andre Guerra on 04/01/18.
//  Copyright © 2018 Andre Guerra. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        self.backgroundColor = .blue
    }
}

class HomeDatasource: Datasource {
    
    let words: Datasource = {
       let datasource = Datasource()
        datasource.objects = ["Good morning","Mr.","War!",]
        return datasource
    }()
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words.objects?[indexPath.item]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
}

class HomeDatasourceController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let datasource = HomeDatasource()
        self.datasource = datasource.words
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
