//
//  NYTTopStoriesTabController.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import UIKit

class NYTTopStoriesTabController: UITabBarController {

    private lazy var firstVC: UINavigationController = {
        let navController = UINavigationController(rootViewController: TopStoriesViewController())
        navController.tabBarItem = UITabBarItem(title: "Top Stories", image: UIImage(systemName: "book"), tag: 0)
        return navController
    }()
    
    private lazy var secondVC: UINavigationController = {
          let navController = UINavigationController(rootViewController: SavedStoriesViewController())
          navController.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "bookmark"), tag: 1)
          return navController
      }()
    
    private lazy var thirdVC: UINavigationController = {
             let navController = UINavigationController(rootViewController: SettingsViewController())
             navController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
             return navController
         }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [firstVC, secondVC, thirdVC]
    }
    


}
