//
//  TableViewCellStuff.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/13/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class TableViewCellStuff: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContents(box: Box) {
        textLabel?.text = box.date
    }
    
}
