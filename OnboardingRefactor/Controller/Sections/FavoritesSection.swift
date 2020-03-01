//
//  FavoritesSection.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

struct FavoritesSection: Section {
    let numberOfItems = 7
    
    let images = ["starfruit", "mangosteen", "lychee", "starfruit", "dragon", "starfruit", "starfruit", ]
    let texts = ["Starfruit", "Mangosteen", "Lychee", "Starfruit", "Dragon Fruit", "Starfruit", "Starfruit", ]
    
    func layoutSection() -> NSCollectionLayoutSection? {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95), heightDimension: .fractionalHeight(0.35))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCell.identifier, for: indexPath) as! FavoritesCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.fruitName.text = texts[indexPath.row]
        return cell
    }
    
}
