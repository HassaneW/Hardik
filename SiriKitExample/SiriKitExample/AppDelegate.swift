//
//  AppDelegate.swift
//  SiriKitExample
//
//  Created by Bunti Nizama on 22/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import Intents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {



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
        
//         INVocabulary.shared().setVocabularyStrings(["Pay my bill", "Pay my electric bill" , "Pay my bill with SiriKit2018" ,"hi","hello","push up", "sit up", "pull up"], of: .workoutActivityName)
        
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        
    }
    
    func application(_ application: UIApplication,
                     continue userActivity: NSUserActivity,
                     restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
               guard let intent = userActivity.interaction?.intent as? INStartWorkoutIntent else {
                      print("AppDelegate: Start Workout Intent - FALSE")
                      return false
                  }
                  print("AppDelegate: Start Workout Intent - TRUE")
                  print(intent)
                  return true
    }

   
//    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
//            guard let intent = userActivity.interaction?.intent as? INStartWorkoutIntent else {
//                print("AppDelegate: Start Workout Intent - FALSE")
//                return false
//            }
//            print("AppDelegate: Start Workout Intent - TRUE")
//            print(intent)
//            return true
//        }


}

