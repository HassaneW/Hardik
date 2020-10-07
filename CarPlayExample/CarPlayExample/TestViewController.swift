//
//  TestViewController.swift
//  CarPlayExample
//
//  Created by Bunti Nizama on 20/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import CarPlay

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func preshedButton(){
        print("Press Button")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
//        appDelegate.viewController.nextButton()
        var alertAction = CPAlertAction(title: "ok", style: .cancel, handler: {
            ack in
            print("test alert button tapped")
        })
        
        var alertActionCancel = CPAlertAction(title: "cancel", style: .cancel, handler: {
                   ack in
                   print("test alert button tapped")
               })
        var alert = CPNavigationAlert(titleVariants: ["test","test2"], subtitleVariants: ["test detail1","test detail2"], image: nil, primaryAction: alertAction, secondaryAction: nil, duration: 2.0)
       
        
//        appDelegate.mapTemplate.present(navigationAlert: <#T##CPNavigationAlert#>, animated: <#T##Bool#>)
        appDelegate.mapTemplate.present(navigationAlert: alert, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//extension TestViewController :  {
//    
//}
