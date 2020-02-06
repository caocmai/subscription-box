//
//  LoginView.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/4/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        return button
       }()
    
    let textField: UITextField = {
        let text = UITextField()
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
        stackView.addSubview(loginButton)
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.addTarget(self, action: #selector(toHomePage), for: .touchUpInside)
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

    }
    
    @objc func toHomePage(_ sender: UIButton){
        print("to home page")
        let nextVC = HomeVC()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func createTextField() {
        view.addSubview(textField)
        textField.text = "this is login page"
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
    
//    func createPage(){
//
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
        createButton()
        createTextField()
        view.backgroundColor = .orange


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
