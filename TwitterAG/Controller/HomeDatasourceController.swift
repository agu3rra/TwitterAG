//
//  HomeDatasourceController.swift
//  TwitterAG
//
//  Created by Andre Guerra on 04/01/18.
//  Copyright © 2018 Andre Guerra. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {

    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies. Something went wrong. Please check your network connectivity and try again later."
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0 // jump lines as required.
        label.isHidden = true
        return label
    }()
    
    // This is called every time the device is rotated.
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionViewLayout.invalidateLayout() // executes view layout again.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Error message label
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() // LBTA method call

        // Loading data
        self.collectionView?.backgroundColor = Colors.twitterBackground
        setupNavigationBarItems()
//        self.datasource = HomeDatasource()
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, error) in
            if let error = error {
                self.errorMessageLabel.isHidden = false
//                print("HomeDatasourceController error fetching json: ", error)
                if let apiError = error as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200 { // Network error
                        self.errorMessageLabel.text = "Connectivity issue. Please check your network connection and try again later."
                    } else {
                        self.errorMessageLabel.text = "Something went wrong. Please try again later."
                    }
                }
                return
            }
            self.datasource = homeDatasource
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // no extra space betwen cells
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 { // users section
            guard let user = self.datasource?.item(indexPath) as? User else {return .zero}
            // estimate cell size based on user bio text
            return CGSize(width: view.frame.width, height: estimatedHeightForText(user.bioText) + 66)
        }
        else { // tweets section
            guard let tweet = datasource?.item(indexPath) as? Tweet else {return .zero} // returns zero width, zero height
            return CGSize(width: view.frame.width, height: estimatedHeightForText(tweet.message) + 74)
        }
    }
    
    private func estimatedHeightForText(_ text: String) -> CGFloat {
        let approximateWidthOfBioText = view.frame.width - 50 - 12 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioText, height: 1000)
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 { // if we're rendering the second section.
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
