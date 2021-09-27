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

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { succes, error in
                guard error == nil else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .default, handler: .none)
                    return alert.addAction(alertAction)
                }
            }
        
        UNUserNotificationCenter.current().delegate = self
        
        window = UIWindow(frame:UIScreen.main.bounds)
        viewController = ToDoList.HomeViewController(nibName: homeViewController, bundle: nil)
        navController = UINavigationController(rootViewController:  viewController!)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

//MARK:- UNUserNotificationCenterDelegate

extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
    completionHandler(.banner)
  }
}
