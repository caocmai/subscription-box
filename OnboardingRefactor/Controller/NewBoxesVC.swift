//
//  NewBoxesVC.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/28/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class NewBoxesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let data: [NewBox] = [NewBox(image: #imageLiteral(resourceName: "northAmerica"), name: "North America"),
                          NewBox(image: #imageLiteral(resourceName: "southAmerica"), name: "South America"),
                          NewBox(image: #imageLiteral(resourceName: "europe"), name: "Europe"),
                          NewBox(image: #imageLiteral(resourceName: "africa"), name: "Africa"),
                          NewBox(image: #imageLiteral(resourceName: "asia"), name: "Asia"),
                          NewBox(image: #imageLiteral(resourceName: "australia"), name: "Australia"),
    ]
    
    lazy var collectionView: UICollectionView = {
        
        //4CustomFlowLayout
        let flow = CustomFlowLayout()
        
        //4CustomFlowLayout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flow)
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
        // Customization
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        //Registering the cell
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "NewboxesCell", bundle: nil), forCellWithReuseIdentifier: "NewboxesCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        navigationItem.title = "Select A New Box By Region"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewboxesCell", for: indexPath) as! NewboxesCell
        cell.setUp(with: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("indexPath.row = ", indexPath.row)
        // Find the current cell
        let cell: NewboxesCell = collectionView.cellForItem(at: indexPath) as! NewboxesCell
        print(cell)
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.4195970297, blue: 0.4206782579, alpha: 1)
    }

}

