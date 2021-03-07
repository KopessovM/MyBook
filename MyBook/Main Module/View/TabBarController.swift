//
//  TabBarController.swift
//  MyBook
//
//  Created by Madi Kupesov on 2/27/21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        // Create Tab one
        let mainPage = ViewController()
        let tabOneBarItem = UITabBarItem(title: "Tab 1", image: UIImage(named: "snowy-owl"), selectedImage: UIImage(named: "snowy-owl"))
    
        mainPage.tabBarItem = tabOneBarItem
            
            /*
            let tabTwo = TabTwoViewController()
            let tabTwoBarItem2 = UITabBarItem(title: "Tab 2", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
            
            tabTwo.tabBarItem = tabTwoBarItem2
            */
            
            self.viewControllers = [mainPage]
        }
        
        // UITabBarControllerDelegate method
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            print("Selected \(viewController.title!)")
        }

}
