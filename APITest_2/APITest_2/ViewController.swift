//
//  ViewController.swift
//  APITest_2
//
//  Created by Wandianga on 05/06/2020.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class ViewController: UIViewController {
    
    var firstModel = FirstModel()
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var dtLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var viewProgress : UIView!
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func showProgrss(){
        viewProgress.isHidden = false
        self.view.isUserInteractionEnabled = false
    }
    
    func hideProgress(){
        viewProgress.isHidden = true
        self.view.isUserInteractionEnabled = true
    }
    @IBAction func apiCall(_ sender: UIButton) {
        
         let url:String =  "https://api.openweathermap.org/data/2.5/weather?id=2172797&appid=b1cd0099d172c57a72e8922c2c2ae7ed"
        self.showProgrss()
        AF.request(url).response { response in
            print(response)
            
            switch response.result {
            case .success(let value):
                let json = JSON(value!)
                print(json)
                self.firstModel.parse(json: json)
                self.displayData()
                print("name : \(self.firstModel.name)")
                print("base : \(self.firstModel.base)")
                print("dt : \(self.firstModel.dt)")
                print("id : \(self.firstModel.id)")
                break
            case .failure(let error):
                print(error)
                break
            }
            
            self.hideProgress()
            
        }
        
    }
    
    func displayData() {
        nameLabel.text = firstModel.name
        baseLabel.text = firstModel.base
        dtLabel.text = String(firstModel.dt)
        idLabel.text = String(firstModel.id)
        
    }
    
}

