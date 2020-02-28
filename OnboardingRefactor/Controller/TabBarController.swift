//
//  TabBarController.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        self.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func setupViewControllers() {
        
        let vc = HomeVC()
        vc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        let navigationController = UINavigationController(rootViewController:vc)

        let vc2 = ListOfBoxes()
        vc2.tabBarItem = UITabBarItem(title: "New", image: UIImage(named: "newbox"), tag: 0)
        let navigationController2 = UINavigationController(rootViewController:vc2)
        
        let vc3 = ListOfBoxes()
        // Will not run
        vc3.title = "HISTORY"
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let navigationController3 = UINavigationController(rootViewController:vc3)

        
        let vc4 = PreMyProfile()
//        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        vc4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "smile"), tag: 0)
        
        
        let navigationController4 = UINavigationController(rootViewController:vc4)

        
        viewControllers = [navigationController, navigationController2, navigationController3, navigationController4]
        
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
