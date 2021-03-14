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
        tabBar.barTintColor = UIColor(red: 60, green: 53, blue: 104)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 232, green: 231, blue: 245)
        tabBar.unselectedItemTintColor = UIColor(red: 183, green: 178, blue: 217)
        tabBar.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          
            let mainPage = ViewController()
            let tabFirstBarItem = UITabBarItem(title: "Books", image: UIImage(named: "book"), selectedImage: UIImage(named: "book"))
            tabFirstBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            mainPage.tabBarItem = tabFirstBarItem
            
            let searchPage = SearchingViewController()
            let tabSecondBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), selectedImage: UIImage(named: "search"))
            tabSecondBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            searchPage.tabBarItem = tabSecondBarItem
        
            let favoritePage = FavoritesViewController()
            let tabThirdBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "heartIcon"), selectedImage: UIImage(named: "heartIcon"))
            tabThirdBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            favoritePage.tabBarItem = tabThirdBarItem
        
            self.viewControllers = [mainPage, searchPage, favoritePage]
        }
        
        // UITabBarControllerDelegate method
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            //print("Selected \(viewController.title!)")
        }

}
