//
//  ViewController.swift
//  CarPlayTest
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
    
    @IBAction func showAlertOnCarPlay(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let alertAction = CPAlertAction(title: "ok", style: .cancel, handler: {
            ack in
            print("test alert button tapped")
        })
        
        //        _ = CPAlertAction(title: "cancel", style: .cancel, handler: {
        //                           ack in
        //                           print("test alert button tapped")
        //                       })
        let alert = CPNavigationAlert(titleVariants: ["test","test2"], subtitleVariants: ["test detail1","test detail2"], image: nil, primaryAction: alertAction, secondaryAction: nil, duration: 2.0)
        
        appDelegate.mapTemplate.present(navigationAlert: alert, animated: true)
    }


}

