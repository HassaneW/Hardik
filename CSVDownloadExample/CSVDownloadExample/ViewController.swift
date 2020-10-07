//
//  ViewController.swift
//  CSVDownloadExample
//
//  Created by Bunti Nizama on 30/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import UIKit
import CSV
import FSPagerView



class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var fsPageView : FSPagerView! {
        didSet {
            self.fsPageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.fsPageView.itemSize = FSPagerView.automaticSize
        }
    }
    
    var fileName = "temp.csv"
    let url = URL(string: "https://www.data.gouv.fr/fr/datasets/r/0739b8e2-abe3-453f-bd63-149231ddc71b")
    var dataArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.downloadCSV()
        // Do any additional setup after loading the view.
    }
    
    private func append(toPath path: String,
                          withPathComponent pathComponent: String) -> String? {
          if var pathURL = URL(string: path) {
              pathURL.appendPathComponent(pathComponent)
              
              return pathURL.absoluteString
          }
          
          return nil
      }
      
       func documentDirectory() -> String {
          let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                      .userDomainMask,
                                                                      true)
          return documentDirectory[0]
      }

   
    
    func downloadCSV(){
        let sessionConfig = URLSessionConfiguration.default
               let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: url!)
        
               let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
                   if let tempLocalUrl = tempLocalUrl, error == nil {
                       // Success
                       if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                           print("Success: \(statusCode)")
                       }
                    guard let filePath = self.append(toPath: self.documentDirectory(),
                                                     withPathComponent: self.fileName) else {
                        return
                    }
                    
                       do {
                        let manager = FileManager.default
                        if (manager.fileExists(atPath: filePath)) {
                            // it's here!!
                            try FileManager.default.removeItem(at: URL(string:"file://\(filePath)")!)
                        }
                        try FileManager.default.copyItem(at: tempLocalUrl, to:URL(string:"file://\(filePath)")!)

                       } catch (let writeError) {
                           print("error writing file \(filePath) : \(writeError)")
                       }
                    
                    self.readCSVFileFromPath()

                   } else {
                       print("Failure: %@", error?.localizedDescription);
                   }
               }
               task.resume()
    }
    
    
    func readCSVFileFromPath(){
        guard let filePath = self.append(toPath: self.documentDirectory(),
                                         withPathComponent: self.fileName) else {
                                            return
        }
        do {
            let contents = try String(contentsOfFile: filePath)
            DispatchQueue.main.async {
                 self.parseCSV(strData: contents)
            }
        } catch {
            print("File Read Error for file \(filePath)")
        }
    }
    
    func parseCSV(strData : String){
       let csv = try! CSVReader(string: strData,
       hasHeaderRow: true)
        dataArray.removeAll()
      while csv.next() != nil {
        dataArray.append("\(csv["ADR_LOCALITE_T"]!)")
      }
        tableView.reloadData()
        fsPageView.reloadData()
//        print(csv.headerRow)
    }

}

extension ViewController : FSPagerViewDelegate , FSPagerViewDataSource {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return dataArray.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
           let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
           
        cell.imageView?.image = UIImage(named: "\((index % 6) + 1)")

         cell.textLabel?.text =  "\(index + 1) : \(dataArray[index])"
        cell.textLabel?.textAlignment = .center
            return cell
    }
    
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(indexPath.row + 1) : \(dataArray[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected Data : \(dataArray[indexPath.row])")
    }
    
    
}



