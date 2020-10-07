//
//  ViewController.swift
//  FirstProject
//
//  Created by Bunti Nizama on 02/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var username:UITextField!
    @IBOutlet var password:UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
    
    
    @IBAction func signin(){
//        if username.text?.count == 0 {
//            self.displayAlert(title: "Empty", message: "Please enter username")
//            return
//            
//        }
//        
//        if password.text?.count == 0 {
//            self.displayAlert(title: "Empty", message: "Please enter password")
//            return
//        }
        
        let storybourd = UIStoryboard.init(name: "Main", bundle: nil)
        let homeViewController = storybourd.instantiateViewController(identifier: "CardsViewController") as! CardsViewController
        self.navigationController?.pushViewController(homeViewController, animated: true)
        
        
    }
    
    func displayAlert(title:String ,message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
   


}


/*
 
 first need to check user entered username and password or not.
 
 */

