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
                Text("Homer Simpson")
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Currently resides in Huntington Beach, CA")
                        .font(.subheadline)
                    Spacer()
                    Text("Loves fruits from South America")
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}