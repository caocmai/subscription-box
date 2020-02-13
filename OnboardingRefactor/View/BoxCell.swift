//
//  BoxCell.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/6/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class BoxCell: UITableViewCell {
    
    let background : UIView = {
      let background = UIView()
      background.backgroundColor = #colorLiteral(red: 0.8186396956, green: 0.7955000997, blue: 1, alpha: 1)
      background.layer.cornerRadius = 5
      background.layer.masksToBounds = true
      background.translatesAutoresizingMaskIntoConstraints = false
      return background
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {

        self.contentView.addSubview(background)
        background.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        background.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true

    }
}
