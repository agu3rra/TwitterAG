//
//  HomeDatasourceController.swift
//  TwitterAG
//
//  Created by Andre Guerra on 04/01/18.
//  Copyright © 2018 Andre Guerra. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = Colors.twitterBackground
        setupNavigationBarItems()
        self.datasource = HomeDatasource()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // no extra space betwen cells
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            // estimate cell size based on user bio text
            let approximateWidthOfBioText = view.frame.width - 50 - 12 - 12 - 2
            let size = CGSize(width: approximateWidthOfBioText, height: 1000)
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
