//
//  LoginView.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/4/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit
import SwiftUI

class LoginView: UIViewController {
    
    var titleConstraintStart: NSLayoutConstraint!
    var titleConstraintEnd: NSLayoutConstraint!
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "FruitBox"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 0.9789169521)
        label.textAlignment = .center
        label.font = UIFont(name: "ChalkboardSE-Bold", size: 65)
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = #colorLiteral(red: 0.838563621, green: 0.994648993, blue: 0.7698670626, alpha: 1)
        return button
       }()
    
    let textField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .init(white: 1.0, alpha: 0)
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()
    
    let passwordField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .init(white: 1.0, alpha: 0)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isSecureTextEntry = true


        return text
    }()
    
    
    let loginImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    func createStackView() {
        view.addSubview(stackView)
        stackView.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.5).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func createButton(){
//        stackView.addArrangedSubview(loginButton)
        view.addSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        
        loginButton.addTarget(self, action: #selector(toHomePage), for: .touchUpInside)
        
//        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
//        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        
        
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.alpha = 0.5
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
            self.loginButton.alpha = 1.0
         },completion: nil)

    }
    

//    @objc func toHomePage(){
//        print("to home page")
//        //        let nextVC = LoginView()
//        //        self.navigationController?.pushViewController(nextVC, animated: true)
//        let navigationController = UINavigationController(rootViewController: HomeVC())
//        self.view.window!.rootViewController = navigationController
//
//        }
    
    
    @objc func toHomePage(){
        print("to home page")
        self.view.window!.rootViewController = TabBarController()
        
        // Tihis is what is need to get the profile view to show SwiftUI
//        let profileView = ContentView()
//        let viewController = UIHostingController(rootView: profileView)
//        then move the then just put the viewcontroller in it instead
        
    }
    

    
    func createTextField() {
        view.addSubview(textField)
        textField.placeholder = "Username"
        textField.font = UIFont.init(name: "Helvetica", size: 30.0)
        
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -75).isActive = true
        

    }
    
    func createPasswordField() {
        view.addSubview(passwordField)
        passwordField.placeholder = "Password"
        passwordField.font = UIFont.init(name: "Helvetica", size: 30.0)

        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        passwordField.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -30).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: textField.leadingAnchor).isActive = true
    
    }
    
    func createLoginImage(){
        
        view.addSubview(loginImage)
        loginImage.image = UIImage(named: "basket")
        loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        loginImage.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -15).isActive = true



    }
    
    func setLabel(){
            
            self.view.addSubview(appNameLabel)

            titleConstraintStart = appNameLabel.centerYAnchor.constraint(equalTo: loginImage.centerYAnchor, constant: 5)
            titleConstraintStart.isActive = true
            
            //Right now it's off
            titleConstraintEnd = appNameLabel.centerYAnchor.constraint(equalTo: loginImage.topAnchor, constant: -60)
            
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            appNameLabel.transform = CGAffineTransform(scaleX: 0, y: 0)

            
        }
    
    override func viewDidAppear(_ animated: Bool) {
            
            titleConstraintStart.isActive = false
            titleConstraintEnd.isActive = true

            
            UIView.animate(withDuration: 1.5, delay: 0.2,
            usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: {
                self.view.layoutIfNeeded()
                self.appNameLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
            
            
            
        }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        createStackView()
        createButton()
        createTextField()
        createPasswordField()
        view.backgroundColor = #colorLiteral(red: 0.9931656718, green: 1, blue: 0.7396706343, alpha: 0.8795216182)
        createLoginImage()
        setLabel()


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
