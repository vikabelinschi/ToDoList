//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Valeria Belinschi on 20.09.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
var navController: UINavigationController?
var ViewController: ViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame:UIScreen.main.bounds)
        ViewController = ToDoList.ViewController(nibName: "ViewController", bundle: nil)
        navController = UINavigationController(rootViewController:  ViewController!)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    
    return true
}
func applicationWillResignActive(_ application: UIApplication) {

}
func applicationDidEnterBackground(_ application: UIApplication) {

}
func applicationWillEnterForeground(_ application: UIApplication) {
}
func applicationDidBecomeActive(_ application: UIApplication) {
}
func applicationWillTerminate(_ application: UIApplication) {
}
}
