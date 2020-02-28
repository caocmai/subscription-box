//
//  ContentView.swift
//  Landmarks2
//
//  Created by Cao Mai on 2/27/20.
//  Copyright © 2020 Make School. All rights reserved.
//
import UIKit
import SwiftUI

class PreMyProfile : UIViewController {
    
    let profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.838563621, green: 0.994648993, blue: 0.7698670626, alpha: 1)
        return button
    }()
    
    let updateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.9931656718, green: 1, blue: 0.7396706343, alpha: 1)
        return button
    }()
    
    
    
    func createButton(){
        view.addSubview(profileButton)
        profileButton.setTitle("VIEW PROFILE", for: .normal)
        
        profileButton.addTarget(self, action: #selector(toProfile), for: .touchUpInside)
        
        profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        profileButton.alpha = 0.5
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            self.profileButton.alpha = 1.0
        },completion: nil)
        
    }
    
    @objc func toProfile(){
        print("to home page")
        
        // Tihis is what is need to get the profile view to show SwiftUI
        let profileView = ContentView()
        let viewController = UIHostingController(rootView: profileView)
        self.navigationController?.pushViewController(viewController, animated: true)
                
    }
    
    func updateProfileButton(){
        view.addSubview(updateButton)
        updateButton.setTitle("UPDATE PROFILE", for: .normal)
        
        updateButton.addTarget(self, action: #selector(toProfile), for: .touchUpInside)
        
        updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        updateButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        updateButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 270).isActive = true
        
        updateButton.alpha = 0.5
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            self.updateButton.alpha = 1.0
        },completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        createButton()
        updateProfileButton()
        view.backgroundColor = #colorLiteral(red: 0.760543406, green: 0.8008234501, blue: 1, alpha: 1)
        navigationItem.title = "PROFILE"
    }
    
    
    
}

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
                    Text("Currently resides in Cupertino, CA")
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
