//
//  ViewController.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/3/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstView: OnboardingPage!
    var secondView: OnboardingPage!
    var thirdView: OnboardingPage!
    var pagesArray: [OnboardingPage] = []
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let container: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fillEqually
        return view
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor(white: 1.0, alpha: 0.4)
        pageControl.currentPageIndicatorTintColor = UIColor.white
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        setViews()
        setPageControl()
    }
    
    func setScrollView() {
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        //This is needed so scroll left to right and not top to bottom
        container.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    // Using the custom view to get it to display properly
    func setViews(){
        firstView = OnboardingPage(message: "Welcome to the amazing Exotic Fruit Box", imageName: "dragon", isLastPage: false, color: .blue)
        secondView = OnboardingPage(message: "Exotic fruits delivered straight to your door", imageName: "starfruit", isLastPage: false, color: .orange)
        thirdView = OnboardingPage(message: "Sign up now and discover amazing tasting fruits", imageName: "mangosteen", isLastPage: true, color: .brown)
        
        thirdView.continueButton.addTarget(self, action: #selector(toLoginPage), for: .touchUpInside)
        
        pagesArray = [firstView, secondView, thirdView]
        
        for page in pagesArray{
            container.addArrangedSubview(page)
            //constraint it to the entire view of the page
            page.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        }
    }
    
    @objc func toLoginPage(){
        print("to login page")
        //        let nextVC = LoginView()
        //        self.navigationController?.pushViewController(nextVC, animated: true)
        //        let navigationController = UINavigationController(rootViewController: LoginView())
        self.view.window!.rootViewController = LoginView()
    }
    
    
    func setPageControl(){
        view.addSubview(pageControl)
        pageControl.numberOfPages = pagesArray.count
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}



