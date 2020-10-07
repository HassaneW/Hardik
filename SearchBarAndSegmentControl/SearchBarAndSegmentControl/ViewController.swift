//
//  ViewController.swift
//  SearchBarAndSegmentControl
//
//  Created by Bunti Nizama on 25/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var segmentControl : UISegmentedControl!
    var dataArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func printSearchText(){
        print("search text :\(searchBar.text!)")
        searchBar.resignFirstResponder()
        searchBar.text = ""
        
        print("sengment selected index :\(segmentControl.selectedSegmentIndex)")
    }
    
    @IBAction func addDataOnArray(){
        if searchBar.text?.count == 0 {
            return
        }
        dataArray.append(searchBar.text!)
        searchBar.text = ""
        print("Data Array : \(dataArray)")
    }
    
    @IBAction func pressSegmentConrol(){
        print("sengment selected index :\(segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex)!)")
        
//        segmentControl.selectedSegmentIndex.description
    }


}


extension ViewController : UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

