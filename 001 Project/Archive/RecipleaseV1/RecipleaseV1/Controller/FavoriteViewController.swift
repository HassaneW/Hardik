//
//  FavoriteViewController.swift
//  RecipleaseV1
//
//  Created by Bunti Nizama on 18/09/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataArray = [NSManagedObject]()

    
    var ingredients = "rice"
    var arrayData = Reciplease(recipe: Recipe(title: "", imageUrl: "", url: "", portions: 0, ingredients: [""], totalTime: 0))
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.getData()
    }
    
    @IBAction func refreshData() {
        self.getData()
    }
    

    
    func getData() {
           let context = appDelegate.persistentContainer.viewContext
           let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
           //request.predicate = NSPredicate(format: "age = %@", "12")
           request.returnsObjectsAsFaults = false

           do {
               dataArray = try context.fetch(request) as! [NSManagedObject]
            if dataArray.count == 0 {
                return
            }
            var recipeArray = [Recipe]()
            for selectedData in dataArray {
                var recipe = Recipe(title: selectedData.value(forKey: "title") as! String, imageUrl: selectedData.value(forKey: "imageUrl") as! String, url: selectedData.value(forKey: "url") as! String, portions: selectedData.value(forKey: "portions") as! Int, ingredients: (selectedData.value(forKey: "ingredients") as! String).components(separatedBy: ","), totalTime: selectedData.value(forKey: "totalTime") as! Int)
                recipeArray.append(recipe)
            }
            arrayData = Reciplease(recipes: recipeArray)
            tableView.reloadData()
               
           } catch {
               
               print("Failed")
           }
       
    }
    
   func deleteData(index : Int){
           let context = appDelegate.persistentContainer.viewContext
           do {
                context.delete(dataArray[index])
               try context.save()
              self.getData()
           } catch {
               print("fail delete")
           }
       }

}


extension FavoriteViewController :UITableViewDelegate, UITableViewDataSource {
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
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        //    objects.remove(at: indexPath.row)
          //  tableView.deleteRows(at: [indexPath], with: .fade)
            self.deleteData(index: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
