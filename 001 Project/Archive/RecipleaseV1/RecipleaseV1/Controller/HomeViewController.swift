//
//  HomeViewController.swift
//  RecipleaseV1
//
//  Created by Bunti Nizama on 18/09/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var ingediantData = [String]()
    @IBOutlet weak var txtIngediant: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addIngrediant(_ sender: Any) {
        if txtIngediant.text!.count > 0 {
            ingediantData.append(txtIngediant.text!)
            txtIngediant.text = ""
            tableView.reloadData()
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        ingediantData.removeAll()
        tableView.reloadData()
    }
    
    @IBAction func searchRecipies(){
        if ingediantData.count == 0 {
            return
        }
        let storybourd = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybourd.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.ingredients = ingediantData.joined(separator: ",")
               self.navigationController?.pushViewController(vc, animated: true)
    }
   

}

extension HomeViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       ingediantData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TitleCell
        cell.titleLabel.text = "- \(ingediantData[indexPath.row])"
        return cell
    }
}
