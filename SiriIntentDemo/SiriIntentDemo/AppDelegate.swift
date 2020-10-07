//
//  AppDelegate.swift
//  SiriIntentDemo
//
//  Created by Bunti Nizama on 23/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import IntentKit
import Intents
import os.log

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.requestAuthorization()
        return true
    }
    
    func requestAuthorization() {
           INPreferences.requestSiriAuthorization { status in
               if status == .authorized {
                   print("Siri services have been authorized")
               } else {
                   print("Siri services have not been authorized")
               }
           }
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {

           os_log("TK421: Continue type = %{public}s", userActivity.activityType)
           
//           guard userActivity.activityType == NSStringFromClass(ViewMyBillIntent.self) ||
//               userActivity.activityType == NSStringFromClass(ViewMyUsageIntent.self) ||
//               userActivity.activityType == NSStringFromClass(PayMyBillIntent.self) ||
             guard  userActivity.activityType == NSUserActivity.viewMyBillActivityType else {
                   os_log("TK421: Can't continue unknown NSUserActivity type = %{public}s", userActivity.activityType)
                   return false
           }
           
           guard let window = window,
               let rootViewController = window.rootViewController as? UINavigationController else {
                   os_log("TK421: Failed to access root view controller.")
                   return false
           }
           
           restorationHandler(rootViewController.viewControllers)
           
           return true
       }


}

