//
//  OnboardingPage.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/3/20.
//  Copyright © 2020 Make School. All rights reserved.
//  MY CUSTOM CLASS


import UIKit

class OnboardingPage: UIView {
    
    var message: String!
    var imageName: String!
    var isLastPage: Bool! = false
    var color: UIColor!
    
    
    required init(message: String, imageName: String, isLastPage: Bool, color: UIColor) {
        super.init(frame: .zero)
        self.message = message
        self.imageName = imageName
        self.isLastPage = isLastPage
        self.color = color
        self.setup()
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = UIColor(white: 1.0, alpha: 0.8)
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("BUTTON", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        return button
    }()
    
   
    
    //Required, just because
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //Required, just becase
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = color
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(messageLabel)
        
        stackView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.5).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        imageView.image = UIImage(named: self.imageName)
        // Not needed
//        self.addSubview(imageView)
        //Give it a height so stackview knows how to divide
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        // Not needed
//        self.addSubview(messageLabel)
        messageLabel.text = message
        
        if isLastPage {
            self.addSubview(continueButton)
            continueButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
            continueButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40).isActive = true
            continueButton.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
            continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    func setGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.0, 3.0]
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        setGradient()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
