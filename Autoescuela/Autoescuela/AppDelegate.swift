//
//  AppDelegate.swift
//  Autoescuela
//
//  Created by user159106 on 6/6/20.
//  Copyright © 2020 user159106. All rights reserved.
//

import UIKit
import Foundation
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
            let navigationController = UINavigationController()
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            let appCoordinator = AppCoordinator(navigationController: navigationController)
            appCoordinator.start()
        return true
    }

}

