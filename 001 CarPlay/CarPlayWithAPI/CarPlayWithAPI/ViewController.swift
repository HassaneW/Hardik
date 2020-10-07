//
//  ViewController.swift
//  CarPlayWithAPI
//
//  Created by Bunti Nizama on 31/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var viewProgress : UIView!
    
    var weatherModelDataArray = [WeatherModel]()
    
    
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
    
    @IBAction func apiCall(){
        let url:String =  "https://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=b1b15e88fa797225412429c1c50c122a1"
        self.showProgrss()
        AF.request(url).response { response in
            print(response)
            
            switch response.result {
            case .success(let value):
                let json = JSON(value!)
                print(json)
                self.weatherModelDataArray.removeAll()
                if let  listData = json["list"].arrayObject {
                    for data in listData {
                        let weather = WeatherModel()
                        weather.parse(json: JSON(data))
                        self.weatherModelDataArray.append(weather)
                    }
                    
                    self.displayDataOnCarPlay()
                    print("data Count :\(self.weatherModelDataArray.count)")
                }
                break
            case .failure(let error):
                print(error)
                break
            }
            
            self.hideProgress()
            
        }
    }
    
    func displayDataOnCarPlay(){
        var appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.displayApiDataOnCarPlay(data: self.weatherModelDataArray)
    }
    
    
}

