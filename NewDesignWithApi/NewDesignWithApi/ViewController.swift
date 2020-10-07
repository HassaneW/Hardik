//
//  ViewController.swift
//  NewDesignWithApi
//
//  Created by Bunti Nizama on 08/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import Alamofire
import JGProgressHUD
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    let urlString = "https://entreprise.data.gouv.fr/api/rna/v1/full_text/test"
    //https://entreprise.data.gouv.fr/api/rna/v1/id/W9C1000188"
    let hud = JGProgressHUD(style: .dark)
    
    var arrayData = [Association]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDataFromApi()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func refreshData(){
        self.getDataFromApi()
    }
    
    func getDataFromApi(){
        hud.textLabel.text = "Fetching Data From Server"
        hud.show(in: self.view)
        AF.request(urlString, parameters: nil).response { response in
            DispatchQueue.main.async {
//                self.tableView.reloadData()
                self.hud.dismiss()
                 switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                if json == JSON.null {
                                    print("error in response :\(json)")
                                    return
                                }
                                else {
                                    self.parceResponse(json: json)
                                    print("response Data :\(json)")
                                }
                                break
                            case .failure(let error):
                                print(error)
                                break
                            }
                
                
                
            }
        }
        
    
        
    }
    
    func parceResponse(json:JSON) {
        self.arrayData.removeAll()
        if let dataArray = json["association"].array {
            for data in dataArray {
                let obj = Association()
                obj.parceData(json: data)
                arrayData.append(obj)
            }
            tableView.reloadData()
        }
    }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TitleCell
        cell.setData(association: self.arrayData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailView = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detailView.selectedAccociation = self.arrayData[indexPath.row]
        self.present(detailView, animated: true, completion: nil)
    }
    
    
}

