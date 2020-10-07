//
//  ViewController.swift
//  SiriMidium
//
//  Created by Bunti Nizama on 23/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import IntentsUI

class ViewController: UIViewController, INUIAddVoiceShortcutViewControllerDelegate {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.displayNotifications), name: Notification.Name(rawValue: "ShowNotifications"), object: nil)
        displaySiriShortcutPopup()
        setupIntentsForSiri()
        // Do any additional setup after loading the view.
        
    }
    
    @objc func displayNotifications(){
        print("display Notifications")
    }
    
    func setupIntentsForSiri() {
        let actionIdentifier = "com.testmedium.shownotifications"
       let activity = NSUserActivity(activityType: actionIdentifier)
       activity.title = "Show Notifications"
        activity.userInfo = ["speech" : "Hardik Start"]
       activity.isEligibleForSearch = true
       if #available(iOS 12.0, *) {
           activity.isEligibleForPrediction = true
           activity.persistentIdentifier = NSUserActivityPersistentIdentifier(actionIdentifier)
       }
       view.userActivity = activity
       activity.becomeCurrent()
    }
    
    func displaySiriShortcutPopup() {
        if #available(iOS 12.0, *) {
            guard let userActivity = view.userActivity else { return }
            let shortcut = INShortcut(userActivity: userActivity)
            let vc = INUIAddVoiceShortcutViewController(shortcut: shortcut)
            vc.delegate = self
            present(vc, animated: true, completion: nil)
        }
    }


}

