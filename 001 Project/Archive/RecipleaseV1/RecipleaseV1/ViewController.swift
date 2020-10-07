//
//  ViewController.swift
//  RecipleaseV1
//
//  Created by Wandianga on 9/10/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit
import  Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var ingredients = "rice"
    var arrayData = Reciplease(recipe: Recipe(title: "", imageUrl: "", url: "", portions: 0, ingredients: [""], totalTime: 0))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.getDataFromApi()
        
    }
    
    @IBAction func refreshData() {
        self.getDataFromApi()
    }
    

    
    func getDataFromApi() {
    
        NetworkService.shared.getRecipes(ingredients: ingredients) { [weak self] result in
            switch result {
            case .success(let reciplease):
                print("count : \(reciplease.recipes.count)")
                self!.arrayData = reciplease
                self!.tableView.reloadData()
                print(reciplease.recipes.first.debugDescription)
            case .failure(let error):
                print("Error fetching recipes \(error.localizedDescription)")
            }
        }
    }

}

extension ViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayData.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TitleCell
        cell.displayData(recipt: self.arrayData.recipes[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storybourd = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybourd.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.data = self.arrayData.recipes[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
     }
}
