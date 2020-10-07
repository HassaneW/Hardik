//
//  ViewController.swift
//  CollationViewExample
//
//  Created by Bunti Nizama on 03/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField :UITextField!
    @IBOutlet weak var collectionView : UICollectionView!
    
    var dataArray = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(){
        if textField.text!.count > 0 {
            dataArray.append(textField.text!)
            textField.text = ""
            print("data Of array")
            print(dataArray)
//            collectionView.reloadData()
        }
    }


}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.size.width  / 2) - 20, height: collectionView.frame.size.width / 3 )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCell
        cell.contentView.backgroundColor = .black
        cell.imageview.image = UIImage(named: dataArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected image name : \(dataArray[indexPath.row])")
    }
}

