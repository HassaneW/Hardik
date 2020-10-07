//
//  DetailViewController.swift
//  RecipleaseV1
//
//  Created by Bunti Nizama on 18/09/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var tableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var data = Recipe(title: "", imageUrl: "", url: "", portions: 0, ingredients: [""], totalTime: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = UIBarButtonItem(image: UIImage(systemName: "star.fill"), style: .plain, target: self, action: #selector(favotiteTapped)) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
        titleLabel.text = data.title
        guard let urlIcon = URL.init(string: data.imageUrl)  else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlIcon) {
                let image = UIImage.init(data: data)
                DispatchQueue.main.async {
                  self?.imgView.image = image
                    self?.imgView.contentMode = .scaleToFill
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func favotiteTapped(){
        let context = appDelegate.persistentContainer.viewContext
              let entity = NSEntityDescription.entity(forEntityName: "Favorite", in: context)
              let newUser = NSManagedObject(entity: entity!, insertInto: context)
              
        newUser.setValue(data.title, forKey: "title")
        newUser.setValue(data.imageUrl, forKey: "imageUrl")

        newUser.setValue(data.url, forKey: "url")

        newUser.setValue(data.portions, forKey: "portions")

        newUser.setValue(data.ingredients.joined(separator: ","), forKey: "ingredients")

        newUser.setValue(data.totalTime, forKey: "totalTime")

             
              do {
                  
                  try context.save()
                  
              } catch {
                  
                  print("Failed saving")
              }
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

extension DetailViewController :UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.data.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TitleCell
        cell.titleLabel.text = "- \(self.data.ingredients[indexPath.row])"
        return cell
    }
}
