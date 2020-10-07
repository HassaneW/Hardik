//
//  ViewController.swift
//  CarPlayFirstProject_01
//
//  Created by Bunti Nizama on 24/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import CarPlay
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func displayAlertOnCarPay(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let alertAction = CPAlertAction(title: "ok", style: .cancel, handler: {
            ack in
            print("test alert button tapped")
        })
        
        let alert = CPNavigationAlert(titleVariants: ["test"], subtitleVariants: ["test detail1"], image: nil, primaryAction: alertAction, secondaryAction: nil, duration: 2.0)
        
        appDelegate.map.present(navigationAlert: alert, animated: true)
    }


}

