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
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { succes, error in
                if let error = error {
                    let alert = UIAlertController(title: LocalizedStrings.Alert.title, message: error.localizedDescription, preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: LocalizedStrings.Alert.admit, style: .default, handler: .none)
                    return alert.addAction(alertAction)
                }
            }
        
        UNUserNotificationCenter.current().delegate = self
        let presenter = HomePresenterImp(with: view)
        view.presenter = presenter
        window = UIWindow(frame:UIScreen.main.bounds)
        navController = UINavigationController(rootViewController:  view)
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
