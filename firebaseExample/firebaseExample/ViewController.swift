//
//  ViewController.swift
//  firebaseExample
//
//  Created by Bunti Nizama on 22/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import UIKit
//import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var btnUpdate : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.loadDataFromFireBase()
        // Do any additional setup after loading the view.
    }
    var stringArray = [String]()
    var selectedIndex = -1
    func loadDataFromFireBase(){
        let childRef = Database.database().reference(withPath: "grocery-items")
        let milkRef = childRef.child("milk")
       
        var refHandle = milkRef.observe(DataEventType.value, with: { (snapshot) in
          let postDict = snapshot.value as? [String] ?? [String]()
          // ...
            self.stringArray = postDict
            self.tableView.reloadData()
            print(postDict)
        })
    }
    
    @IBAction func addDataOnFirebase(_ sender: Any) {

      let rootRef = Database.database().reference()



        // 3
        let itemsRef = rootRef.child("grocery-items")

        // 4
        let milkRef = itemsRef.child("milk")
        stringArray.append(textField.text!)
        milkRef.setValue(stringArray)
        self.tableView.reloadData()
        textField.text = ""
    }
    
    @IBAction func updateData(){
        let rootRef = Database.database().reference()


        // 3
        let itemsRef = rootRef.child("grocery-items")

        // 4
        let milkRef = itemsRef.child("milk")
        stringArray[selectedIndex] = textField.text!
        milkRef.setValue(stringArray)
        self.tableView.reloadData()
        selectedIndex = -1
        btnUpdate.isHidden = true
        textField.text = ""
    }
    
     func delete(index : Int) {
        let rootRef = Database.database().reference()

        // 2
        let childRef = Database.database().reference(withPath: "grocery-items")

        // 3
        let itemsRef = rootRef.child("grocery-items")

        // 4
        let milkRef = itemsRef.child("milk")
        stringArray.remove(at: index)
        milkRef.setValue(stringArray)
        self.tableView.reloadData()
        textField.text = ""
    }
    

    

}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = stringArray[indexPath.row]
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.delete(index: indexPath.row)
        selectedIndex = indexPath.row
        textField.text = stringArray[indexPath.row]
        btnUpdate.isHidden = false
    }
    
    
}

