//
//  ContentView.swift
//  Landmarks2
//
//  Created by Cao Mai on 2/27/20.
//  Copyright © 2020 Make School. All rights reserved.
//
import SwiftUI


struct ContentView: View {
    
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .center) {
                Text("Johnny Appleseed")
                    .font(.title)
                    .padding()

                Text("Hometown: Huntington Beach, CA")
                    .font(.subheadline)
                Text("Loves fruits from South America")
                    .font(.subheadline)
            }
            .padding()
            
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
