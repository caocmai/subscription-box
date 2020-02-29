

import UIKit

struct FeaturedSection: Section {
    let numberOfItems = 4
    let images = ["dragon", "mangosteen", "lychee", "starfruit"]
    let texts = ["Dragon Fruit", "Mangosteen", "Lychee", "Starfruit"]

    
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
