//
//  ViewController.swift
//  CarPlayImageView
//
//  Created by Bunti Nizama on 28/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.viewController.next()
        
    }


}

