//
//  TabBarController.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//
import SwiftUI

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.delegate = self
    }
    
    func setupViewControllers() {
        
        let homeVC = HomeVC()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let homeNav = UINavigationController(rootViewController: homeVC)

        let newboxVC = NewBoxesVC()
        newboxVC.tabBarItem = UITabBarItem(title: "New", image: UIImage(named: "newbox"), tag: 0)
        let newboxNav = UINavigationController(rootViewController:newboxVC)
        
        let boxesVC = ListOfBoxes()
        // Will not run the .title to something custom
//        boxesVC.title = "HISTORY"
        let boxesNav = UINavigationController(rootViewController:boxesVC)
        boxesNav.title = "SAMPLE"
        boxesNav.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)

        
//        
        // Tihis is what is need to get the profile view to show SwiftUI
        let profileVC = ContentView() // SwiftUI
        let hostNavVC = UIHostingController(rootView: profileVC)
        // This changes it to regular ui kit
        let profileNav = UINavigationController(rootViewController:hostNavVC)
        
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "smile"), tag: 0)
        
    
        viewControllers = [homeNav, newboxNav, boxesNav, profileNav]
        
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



extension TabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected a new view controller")
    }
    
}
