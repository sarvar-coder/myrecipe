//
//  MainTabBarController.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 17/03/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViewController()
    }

    func setupViewController() {
    
        let vc1 = UINavigationController(rootViewController: UIViewController())
        let vc2 = UINavigationController(rootViewController: UIViewController())
        
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3)
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        
        viewControllers = [vc1, vc2]
    }

}

