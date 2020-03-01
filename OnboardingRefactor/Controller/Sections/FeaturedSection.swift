//
//  FeaturedSection.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

struct FeaturedSection: Section {
    let numberOfItems = 4
    let images = ["dragon", "mangosteen", "lychee", "starfruit", "dragon"]
    let texts = ["Dragon Fruit", "Mangosteen", "Lychee", "Starfruit", "Dragon Fruit"]
    
    func layoutSection() -> NSCollectionLayoutSection? {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(300))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
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
