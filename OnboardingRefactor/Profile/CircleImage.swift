//
//  CircleImage.swift
//  Landmarks2
//
//  Created by Cao Mai on 2/27/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
    
        Image("man")
            .resizable()
            .scaledToFit()
            .frame(width: 200.0,height:200)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
