//
//  ViewController.swift
//  SiriIntentDemo
//
//  Created by Bunti Nizama on 23/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didPressViewMyBill(_ sender: Any) {
           navigateToBillingScreen(nil)
       }
    
    func navigateToBillingScreen(_ activity: NSUserActivity?) {
           let viewController = BillViewController(activity)
           navigationController?.popToRootViewController(animated: false)
           navigationController?.pushViewController(viewController, animated: true)
       }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
           os_log("TK421: %{public}s", "\(#function)")
           super.restoreUserActivityState(activity)
           
           if activity.activityType == NSUserActivity.viewMyBillActivityType {
               navigateToBillingScreen(activity)
           }
//           else if activity.activityType == NSStringFromClass(ViewMyBillIntent.self) {
//               navigateToBillingScreen(activity)
//           } else if activity.activityType == NSStringFromClass(PayMyBillIntent.self) {
//               navigateToPaymentScreen(activity)
//           } else if activity.activityType == NSStringFromClass(ViewMyUsageIntent.self) {
//               navigateToUsageScreen(activity)
//           }
       }
}

