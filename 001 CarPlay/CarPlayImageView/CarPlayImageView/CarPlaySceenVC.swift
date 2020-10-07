//
//  CarPlaySceenVC.swift
//  CarPlayImage
//
//  Created by Bunti Nizama on 28/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit

class CarPlaySceenVC: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    var currentIndex = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "\(currentIndex)")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(){
        currentIndex += 1
        if currentIndex > 7 {
            currentIndex = 1
        }
        imageView.image = UIImage(named: "\(currentIndex)")

    }
    

}
