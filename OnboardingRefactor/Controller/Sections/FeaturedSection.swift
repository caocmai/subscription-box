//
//  FeaturedSection.swift
//  CompositionalCollection
//
//  Created by Adriana González Martínez on 2/12/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import UIKit

struct FeaturedSection: Section {
    let numberOfItems = 6
    let images = ["dragon", "mangosteen", "dragon", "starfruit"]
    let texts = ["Dragon Fruit", "Mangosteen", "Dragon Fruit", "Starfruit"]

    
    func layoutSection() -> NSCollectionLayoutSection? {
        // TODO: Step 1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        // TODO: Step 2
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // T ODO:Step 3: Try using the absolute values, around 200 by 300
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // TODO: Step 5
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.identifier, for: indexPath) as! FeaturedCell
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.textLabel.text = texts[indexPath.row]
        return cell
    }
    
    
    
}
