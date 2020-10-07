//
//  AppDelegate.swift
//  CarPlayWithAPI
//
//  Created by Bunti Nizama on 31/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import  CarPlay

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var listTemplate : CPListTemplate!
    var interface : CPInterfaceController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
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
    
    func displayApiDataOnCarPlay(data : [WeatherModel]){
        var listTempArray = [CPListItem]()
        
        for  dataItem in data {
            let listItem = CPListItem(text: dataItem.weather.main, detailText: dataItem.weather.description1)
            listTempArray.append(listItem)
        }
        let section = CPListSection(items: listTempArray)
        listTemplate = CPListTemplate(title: "Section Title", sections: [section])
        listTemplate.delegate = self
        interface.setRootTemplate(listTemplate, animated: true)
    }


}

extension AppDelegate : CPListTemplateDelegate {
    func listTemplate(_ listTemplate: CPListTemplate, didSelect item: CPListItem, completionHandler: @escaping () -> Void) {
    
        print("data : \(item.detailText)")
    }
}

extension AppDelegate : CPApplicationDelegate{
    func application(_ application: UIApplication, didConnectCarInterfaceController interfaceController: CPInterfaceController, to window: CPWindow) {
        
        let listItem = CPListItem(text: "Test", detailText: "Detail")
        let section = CPListSection(items: [listItem])
        
        listTemplate = CPListTemplate(title: "Section Title", sections: [section])
        
        interfaceController.setRootTemplate(listTemplate, animated: true)
        interface = interfaceController
    }
    
    func application(_ application: UIApplication, didDisconnectCarInterfaceController interfaceController: CPInterfaceController, from window: CPWindow) {
        
    }
    
    
}

