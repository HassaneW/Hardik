//
//  ViewController.swift
//  NeumorphicExample
//
//  Created by Bunti Nizama on 10/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import MHSoftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var backGroudView : UIView!
    @IBOutlet weak var titlebackGroudView : UIView!
    @IBOutlet weak var titleLable : UILabel!
    @IBOutlet weak var playButton : UIButton!
    @IBOutlet weak var stopButton : UIButton!
    @IBOutlet weak var likeButton : UIButton!
    @IBOutlet weak var likeCountLabel : UILabel!
    @IBOutlet weak var likeCounBackGroudView : UIView!

    
    @IBOutlet weak var imageView : UIImageView!
    
    var currentIndex = 0
    var likeCounter = 0
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(red: 241/255, green: 243/255, blue: 246/255, alpha: 1.0)
        backGroudView.addSoftUIEffectForView()
        titlebackGroudView.addSoftUIEffectForView()
        playButton.addSoftUIEffectForButton()
        stopButton.addSoftUIEffectForButton()
        likeButton.addSoftUIEffectForButton()
        likeCounBackGroudView.addSoftUIEffectForView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func play(){
        timer.invalidate() // just in case this button is tapped multiple times

        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    
    }
    
    // called every time interval from the timer
    @objc func timerAction() {
        self.currentIndex += 1
        if self.currentIndex > 7 {
            self.currentIndex = 1
        }
        
        self.imageView.image = UIImage(named: "\(self.currentIndex)")
    }
    
    @IBAction func stop(){
        timer.invalidate()
    }
    
    @IBAction func like(){
        likeCounter += 1
        likeCountLabel.text = "Like : \(likeCounter)"
        
    }


}

