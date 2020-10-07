//
//  AppDelegate.swift
//  CarPlayFirstProject_01
//
//  Created by Bunti Nizama on 24/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import CarPlay

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var map = CPMapTemplate()
    var listControlTemplate : CPListTemplate!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
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


}

extension AppDelegate :CPApplicationDelegate {
    func application(_ application: UIApplication, didConnectCarInterfaceController interfaceController: CPInterfaceController, to window: CPWindow) {
//                let cplistitem = CPListItem(text: "test list item", detailText: "detail")
//                let cplist = CPListSection(items: [cplistitem,cplistitem,cplistitem,cplistitem,cplistitem,cplistitem,cplistitem,cplistitem], header: "", sectionIndexTitle: "section index")
//                 listControlTemplate = CPListTemplate(title: "test", sections: [cplist])//CPVoiceControlTemplate(voiceControlStates: [voiceControlState])
                
                
                
                interfaceController.setRootTemplate(map, animated: true)
    }
    
    func application(_ application: UIApplication, didDisconnectCarInterfaceController interfaceController: CPInterfaceController, from window: CPWindow) {
        
    }
    
    
}

