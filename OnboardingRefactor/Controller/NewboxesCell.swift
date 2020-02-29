//
//  NewboxesCell.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/28/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class NewboxesCell: UICollectionViewCell {
    
    static var identifier: String = "NewboxesCell"

    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.cornerRadius = 10
        self.image.contentMode = .scaleAspectFit

    }
    
    public func configure(with model: NewBox) {
        image.image = model.image
        name.text = model.name
    }

}


