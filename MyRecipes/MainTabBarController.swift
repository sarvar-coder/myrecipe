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
    
        let recipesViewController = RecipesViewController.configure()
        // TODO: FAVOURITE VIEW 
        
        let recipesNavController = UINavigationController(rootViewController: recipesViewController)
        
        recipesNavController.tabBarItem =  UITabBarItem(title: "Recipes", image: UIImage(systemName: "book"), tag: 0)
                
        viewControllers = [recipesNavController]
    }
}

