//
//  ViewController.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/3/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // this is similar to var something: Int, then later something = 4, or like var something: Int = 13
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
    
    // Valid syntax
    let something: Int = {
        return 12
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
        firstView = OnboardingPage(message: "page 1 is this one", imageName: "test1", isLastPage: false, color: .blue)
        secondView = OnboardingPage(message: "page 2 is now this", imageName: "test2", isLastPage: false, color: .orange)
        thirdView = OnboardingPage(message: "page 3 is the end", imageName: "test1", isLastPage: true, color: .green)
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
        let nextVC = LoginView()
        self.navigationController?.pushViewController(nextVC, animated: true)
       }
    
    func setPageControl(){
        view.addSubview(pageControl)
        pageControl.numberOfPages = pagesArray.count
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    }
    
    // Use this function to move the dots, but need to have ViewController: UIScrollViewDelegate
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let pageIndex = round(scrollView.contentOffset.x/scrollView.frame.size.width)
//        pageControl.currentPage = Int(pageIndex)
//
//    }

}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

//extension UINavigationController {
//    /**
//     It removes all view controllers from navigation controller then set the new root view controller and it pops.
//
//     - parameter vc: root view controller to set a new
//     */
//    func initRootViewController(vc: UIViewController, transitionType type: String = "kCATransitionFade", duration: CFTimeInterval = 0.3) {
//        self.addTransition(transitionType: type, duration: duration)
//        self.viewControllers.removeAll()
//        self.pushViewController(vc, animated: false)
//        self.popToRootViewController(animated: false)
//    }
//
//    /**
//     It adds the animation of navigation flow.
//
//     - parameter type: kCATransitionType, it means style of animation
//     - parameter duration: CFTimeInterval, duration of animation
//     */
//    private func addTransition(transitionType type: String = "kCATransitionFade", duration: CFTimeInterval = 0.3) {
//        let transition = CATransition()
//        transition.duration = duration
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType(rawValue: type)
//        self.view.layer.add(transition, forKey: nil)
//    }
//}
