//
//  AppDelegate.swift
//  Photocopier
//
//  Created by Varun Iyer on 11/12/19.
//  Copyright © 2019 ATeam. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let photocopierViewController = PhotocopierViewController()
        self.window?.rootViewController = photocopierViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

