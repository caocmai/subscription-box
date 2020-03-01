//
//  BoxModel.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/11/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import Foundation
import UIKit


struct Item{
    let name: String
    let image: String
}

struct Box{
    let date: String
    let items: [Item]
    let image: String
}

struct NewBox {
    let image: UIImage
    let name: String
}

// Maybe will add more later
//struct Category{
//    let name: String
//    let image: String
//}
//
//struct User{
//
//
//}
