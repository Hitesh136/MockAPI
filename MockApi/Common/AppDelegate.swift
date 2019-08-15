//
//  AppDelegate.swift
//  MockApi
//
//  Created by Hitesh  Agarwal on 15/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        let usersViewController = storyboard.instantiateViewController(withIdentifier: "UsersViewController") as! UsersViewController
        
        let navigationController = UINavigationController(rootViewController: usersViewController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}
