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
    let homeViewController = String(describing: HomeViewController.self)
    let view = HomeViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let presenter = HomePresenterImp(with: view)
        view.presenter = presenter
        window = UIWindow(frame:UIScreen.main.bounds)
        navController = UINavigationController(rootViewController:  view)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}

//let view = HomeViewController()
//let presenter = HomePresenterImp(with: view)
//view.presenter = presenter
//
//window = UIWindow(frame:UIScreen.main.bounds)
//viewController = ToDoList.HomeViewController(nibName: homeViewController, bundle: nil)
//navController = UINavigationController(rootViewController:  viewController!)
//window?.rootViewController = navController
//window?.makeKeyAndVisible()
