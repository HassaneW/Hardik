//
//  ViewController.swift
//  CoreData
//
//  Created by Bunti Nizama on 17/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var btnUpate : UIButton!
    @IBOutlet weak var btnDelete : UIButton!
   
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var dataArray = [NSManagedObject]()
    var selectedData = NSManagedObject()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.loadDataFromCoreData()
        self.hideUpdateDelete(ishide: true)
        // Do any additional setup after loading the view.
    }
    
    func hideUpdateDelete(ishide : Bool) {
        btnUpate.isHidden = ishide
        btnDelete.isHidden = ishide
    }

    @IBAction func addData(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "EmployeeTable", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(txtName.text, forKey: "name")
        newUser.setValue(txtAddress.text, forKey: "address")
       
        do {
            
            try context.save()
            txtName.text = ""
            txtAddress.text = ""
            self.loadDataFromCoreData()
        } catch {
            
            print("Failed saving")
        }
    }
    
    @IBAction func updateData(){
        let context = appDelegate.persistentContainer.viewContext
        selectedData.setValue(txtName.text!, forKey: "name")
        selectedData.setValue(txtAddress.text!, forKey: "address")
        do {
            try context.save()
            txtName.text = ""
            txtAddress.text = ""
            self.loadDataFromCoreData()
            self.hideUpdateDelete(ishide: true)
        } catch {
            print("fail Update")
        }
       }
    
    @IBAction func deleteData(){
        let context = appDelegate.persistentContainer.viewContext
        do {
             context.delete(selectedData)
            try context.save()
            txtName.text = ""
           txtAddress.text = ""
           self.loadDataFromCoreData()
           self.hideUpdateDelete(ishide: true)
        } catch {
            print("fail delete")
        }
    }
    
    func loadDataFromCoreData(){
        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EmployeeTable")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false

        do {
            dataArray = try context.fetch(request) as! [NSManagedObject]
            tableView.reloadData()
            
        } catch {
            
            print("Failed")
        }

    }
    
   
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let name = dataArray[indexPath.row].value(forKey: "name") as! String
        let address = dataArray[indexPath.row].value(forKey: "address") as! String
        cell.textLabel?.text = "\(name):\(address)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedData = dataArray[indexPath.row]
        txtName.text = selectedData.value(forKey: "name") as! String
        txtAddress.text = selectedData.value(forKey: "address") as! String
        self.hideUpdateDelete(ishide: false)
    }
    
    
}

