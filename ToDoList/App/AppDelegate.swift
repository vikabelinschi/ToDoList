//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var navController: UINavigationController?
    private var viewController: HomeViewController?
    let homeViewController = String(describing: HomeViewController.self)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.main.bounds)
        viewController = ToDoList.HomeViewController(nibName: homeViewController, bundle: nil)
        navController = UINavigationController(rootViewController:  viewController!)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}
