//
//  NSUserActivity+IntentData.swift
//  SiriIntentDemo
//
//  Created by Bunti Nizama on 23/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import Foundation
import Intents

extension NSUserActivity {
    
    public static let viewMyBillActivityType = "com.jclacey.intentkit.viewmybill"
    
    public static var viewMyBillActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: NSUserActivity.viewMyBillActivityType)
        
        userActivity.title = "View My Current Bill"
        userActivity.persistentIdentifier = NSUserActivityPersistentIdentifier(NSUserActivity.viewMyBillActivityType)
        userActivity.isEligibleForPrediction = true
        userActivity.suggestedInvocationPhrase = "View My Bill"
        
        return userActivity
    }
}
