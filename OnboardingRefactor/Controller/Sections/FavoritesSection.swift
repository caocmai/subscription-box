//
//  FavoritesSection.swift
//  CompositionalCollection
//
//  Created by Adriana González Martínez on 2/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

struct FavoritesSection: Section {
    let numberOfItems = 6
    
    func layoutSection() -> NSCollectionLayoutSection? {
        
        // TODO: Step 1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        // TODO: Step 2
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // TODO: Step 3. Try using 95% width and 35% height
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.35))
        
        // TODO: Step 4. You will need to specify how many items per group (3)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
        
        // TODO: Step 5
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FavoritesCell.self), for: indexPath)
    }
}
