//
//  CollectionVC.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {
    
    
    lazy var collectionView: UICollectionView = {
        
        //4CustomFlowLayout
        let flow = CustomFlowLayout()
        
        // Instantiating the UICollectionView, using the default flow layout
//        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        //4CustomFlowLayout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //TODO: Set the datasource & delegate
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        // Customization
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        
        //TODO: Register the cell
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        
        return collectionView
    }()
    
    var data: [String] = Array(repeating: "👾", count: 10)


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CollectionVC: UICollectionViewDelegate {
    //Not needed to work
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//    }

}

extension CollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        let data = self.data[indexPath.item]
        cell.textLabel.text = "\(data) : \(indexPath.row)"
        cell.textLabel.textColor = UIColor.white
        return cell
    }
    
    
}

//Either one or the other delegate to work
// NEED TO COMMENT OUT This for custom flow to work!!
extension CollectionVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

}


// Custom View of Cell, not even custom view just the way to populate cell of collectionview
class Cell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Layout views inside the cell
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textLabel)
        
        // Aplying constraints
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
            ])
        
        // Customization
        self.backgroundColor = UIColor.lightGray
        self.textLabel = textLabel
        self.textLabel.font = UIFont(name: "Helvetica", size: 26)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}

//Custom View of FLOW!
class CustomFlowLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
//        self.itemSize = CGSize(width: cv.bounds.inset(by: cv.layoutMargins).size.width, height: 70.0)
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.sectionInsetReference = .fromSafeArea
        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let minColumnWidth = CGFloat(300)
        let maxNumColumns = Int(availableWidth/minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)

        self.itemSize = CGSize(width: cellWidth, height: 80.0)

    }

}
