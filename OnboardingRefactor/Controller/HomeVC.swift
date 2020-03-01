//
//  HomeVC.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/4/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    var collectionView: UICollectionView!
    
    lazy var sections: [Section] = [
                                    TitleSection(title: "Featured Fruits"),
                                    FeaturedSection(),
                                    TitleSection(title: "Last Month's Favorites"),
                                    FavoritesSection()
    ]
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        //        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
        collectionView.register(UINib(nibName: "FeaturedCell", bundle: .main), forCellWithReuseIdentifier: FeaturedCell.identifier)
        collectionView.register(UINib(nibName: "FavoritesCell", bundle: .main), forCellWithReuseIdentifier: FavoritesCell.identifier)
        self.view.addSubview(collectionView)
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // If uncomment will change the uitabbar on bottom to have same name ie "compsotional layout"
        //        self.title = "Compositional Layout"
        navigationItem.title = "HOME"
        self.view.backgroundColor = UIColor.white
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.reloadData()
    }
    
}


extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let featuredSec = FeaturedSection()
        let favoriateSec = FavoritesSection()
    
        var count = 0
        // A new case is excuted every time a new section is created, in this case it's 4.
        switch section {
        case 0:
            count = 1
        case 1:
            count = featuredSec.images.count
        case 2:
            count = 1
        case 3:
            count = favoriateSec.images.count
        default:
            count = sections[section].numberOfItems
            break
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
        
    }
}
