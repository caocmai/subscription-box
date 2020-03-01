//
//  CustomFlowLayout.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/28/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import Foundation
import UIKit

//Custom View of FLOW!
class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        //        self.itemSize = CGSize(width: cv.bounds.inset(by: cv.layoutMargins).size.width, height: 70.0)
        self.sectionInset = UIEdgeInsets(top: 10, left: 3.5, bottom: 15, right: 3.5)
        self.sectionInsetReference = .fromSafeArea
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let minColumnWidth = CGFloat(160)
        let maxNumColumns = Int(availableWidth/minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: 200)
        
    }
    
}
