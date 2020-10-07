//
//  TestViewController.swift
//  CarPlayExample
//
//  Created by Bunti Nizama on 20/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import CarPlay

class CarPlayViewController: UIViewController {

    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var button : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "\(currntIndex)")

        // Do any additional setup after loading the view.
    }
    var dataArray : [String] = ["1","2","3","4","5","6","7"]
    var currntIndex = 1
    
    @IBAction func preshedButton(){
        print("Press Button")
        self.nextButton()
    }
    
    func nextButton(){
        currntIndex += 1
        if dataArray.count == currntIndex {
            currntIndex = 1
        }
        imageView.image = UIImage(named: "\(currntIndex)")
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



