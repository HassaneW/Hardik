//
//  HomeViewController.swift
//  FirstProject
//
//  Created by Bunti Nizama on 02/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var dataArray : Results<realMFirstTable>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.readData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func addData(_ sender: Any) {
        
        if textField.text!.count > 0 {
//            dataAarrey.append(textField.text!)
                       //            DispatchQueue.main.async {
                       let realm = try! Realm()
                       try! realm.write {
                        let obj = realMFirstTable()
                        obj.setValue(nameStr: self.textField.text!)
                           
                           realm.add(obj)
                       }
                   
            
            textField.text = ""
            self.readData()
        }
    }
    
    func readData() {
        let realm = try! Realm()
       dataArray = realm.objects(realMFirstTable.self)
        self.tableView.reloadData()
    }
    
    func removeData(index:Int){
        let realm = try! Realm()
        try! realm.write {
         let obj = dataArray[index]
         
            
            realm.delete(obj)
        }
        self.readData()
    }
    
    func updateName(index:Int){
        let realm = try! Realm()
               try! realm.write {
                let obj = dataArray[index]
                obj.name = "test"
                   
//                realm.add(obj, update: .modified)
               }
               self.readData()
    }

}

extension HomeViewController : UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath) as UITableViewCell
        
        cell.textLabel?.text = dataArray[indexPath.row].name;
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.removeData(index: indexPath.row)
        self.updateName(index: indexPath.row)
    }

}
