//
//  AppDelegate.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 17/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = MainTabBarController()
        
        return true
    }
    
    
    
}

