//
//  ViewController.swift
//  SwitchScrollViewExample
//
//  Created by Bunti Nizama on 06/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchForTest: UISwitch!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changeSwichValue(_ sender: UISwitch) {
        print("swich value :\(sender.isOn)")
        if sender.isOn == true{
            slider.isHidden = false
        } else {
            slider.isHidden = true
        }
    }
    @IBAction func changeSliderValue(_ sender: Any) {
        print("slidet value : \(Int(slider.value))")
    }
    

}

