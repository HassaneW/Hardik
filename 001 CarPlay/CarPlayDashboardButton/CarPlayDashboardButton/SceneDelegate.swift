//
//  SceneDelegate.swift
//  CarPlayDashboardButton
//
//  Created by Bunti Nizama on 29/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import CarPlay

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
            let navC = UINavigationController(rootViewController: vc)
            window.rootViewController = navC
            self.window = window
            
            self.window?.makeKeyAndVisible()
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    var carWindow: UIWindow?

    func updateCarWindow() {

    guard let screen = UIScreen.screens.first(where:
        {
            $0.traitCollection.userInterfaceIdiom == .carPlay
            
    }) else { // CarPlay is not connected
        self.carWindow = nil; return }

    // CarPlay is connected
        let carWindow = UIWindow(frame: screen.bounds)
        carWindow.screen = screen
        carWindow.makeKeyAndVisible()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                  let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
    carWindow.rootViewController = vc

    self.carWindow = carWindow

    }
        func sceneDidDisconnect(_ scene: UIScene) {
            // Called as the scene is being released by the system.
            // This occurs shortly after the scene enters the background, or when its session is discarded.
            // Release any resources associated with this scene that can be re-created the next time the scene connects.
            // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        }
        
        func sceneDidBecomeActive(_ scene: UIScene) {
            // Called when the scene has moved from an inactive state to an active state.
            // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        }
        
        func sceneWillResignActive(_ scene: UIScene) {
            // Called when the scene will move from an active state to an inactive state.
            // This may occur due to temporary interruptions (ex. an incoming phone call).
        }
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            // Called as the scene transitions from the background to the foreground.
            // Use this method to undo the changes made on entering the background.
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.
        }
        
        
    }

extension SceneDelegate : CPTemplateApplicationDashboardSceneDelegate {
    func templateApplicationDashboardScene(_ templateApplicationDashboardScene: CPTemplateApplicationDashboardScene, didConnect dashboardController: CPDashboardController, to window: UIWindow) {
        
       
        let button = CPDashboardButton(titleVariants: ["title"], subtitleVariants: ["subTitle"], image: UIImage(named: "1")!, handler: { btn in
            print("ok")
        })
        
        dashboardController.shortcutButtons = [button]
        
    }
    
    func templateApplicationDashboardScene(_ templateApplicationDashboardScene: CPTemplateApplicationDashboardScene, didDisconnect dashboardController: CPDashboardController, from window: UIWindow) {
        
    }
}

class  test: CPTemplateApplicationScene {
    
}

