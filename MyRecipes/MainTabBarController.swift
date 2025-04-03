//
//  MainTabBarController.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 17/03/25.
//

import UIKit
import CoreData

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .systemMint
        setupViewController()
        set()
    }
    
    func setupViewController() {
        
        let recipesViewController = RecipesViewController.configure()
        let favViewController = FavouritesViewController()
        
        let recipesNavController = UINavigationController(rootViewController: recipesViewController)
        let favNavConrtoller = UINavigationController(rootViewController: favViewController)
        
        recipesNavController.tabBarItem =  UITabBarItem(title: "Recipes",
                                                        image: UIImage(systemName: "book"),
                                                        tag: 0)
        
        favNavConrtoller.tabBarItem = UITabBarItem(title: "Favourites",
                                                   image: UIImage(systemName: "heart"),
                                                   tag: 1)
        
        viewControllers = [recipesNavController, favNavConrtoller]
    }
    
    func set() {
        if let favTabItem = tabBar.items?[1] {
            favTabItem.image = UIImage(systemName: "heart")
            favTabItem.selectedImage = UIImage(systemName: "heart.fill")
        }
        
        
        if let recipeTabItem = tabBar.items?[0] {
            recipeTabItem.image  = UIImage(systemName: "book")
            recipeTabItem.selectedImage = UIImage(systemName: "book.fill")
        }
    }
    
    static func passContextToRecipeVC(window: UIWindow?, _ managedContext: NSManagedObjectContext) {
        let tabBarController = window?.rootViewController as! UITabBarController
        if let navController = tabBarController.viewControllers?.first as? UINavigationController,
           let viewController = navController.viewControllers[0] as? RecipesViewController {
            viewController.managedObjectContext = managedContext
        }
    }
    
    static func passContextToFavVC(window: UIWindow?, _ managedContext: NSManagedObjectContext) {
        let tabBarController = window?.rootViewController as! UITabBarController
        if let navController = tabBarController.viewControllers?.last as? UINavigationController,
           let viewController = navController.viewControllers[0] as? FavouritesViewController {
            viewController.managedObjectContext = managedContext
        }
    }
}


