//
//  Section.swift
//  CompositionalCollection
//
//  Created by Adriana González Martínez on 2/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection?
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
