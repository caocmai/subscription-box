//
//  HomeVC.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/4/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let boxButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        return button
       }()
    
    let newButton: UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setTitleColor(UIColor.orange, for: .normal)
         button.layer.cornerRadius = 10
         button.layer.masksToBounds = true
         button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
         return button
    }()
    
    let textField: UILabel = {
        let text = UILabel()
        text.backgroundColor = .blue
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()
    
    func createStackView() {
        view.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.5).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func createButton(){
        stackView.addArrangedSubview(boxButton)
        stackView.addArrangedSubview(newButton)
        newButton.setTitle("NEW BOX", for: .normal)
        boxButton.setTitle("BOXES", for: .normal)
        boxButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        boxButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        boxButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        boxButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
    
    
    func createTextField() {
        view.addSubview(textField)
        textField.text = "THis is HOMEPAGE"
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20).isActive = true

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
        createButton()
        createTextField()
        view.backgroundColor = .blue

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
