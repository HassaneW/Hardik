//
//  ListViewController.swift
//  GeoFancing
//
//  Created by Bunti Nizama on 26/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    var addressList = [Address]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        self.title = "Address Count:\(addressList.count)"
        // Do any additional setup after loading the view.
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

extension ListViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddressCell
               cell.setData(address: self.addressList[indexPath.row])
               return cell
    }
    
    
}





class AddressCell: UITableViewCell {
    @IBOutlet weak var addressLabel : UILabel!
    @IBOutlet weak var postalCodeLabel : UILabel!
    @IBOutlet weak var addrssIdLabel : UILabel!
     @IBOutlet weak var latLabel : UILabel!
     @IBOutlet weak var longLabel : UILabel!
    
    
   
    func setData(address : Address) {
        addressLabel.text = address.address
        postalCodeLabel.text = address.postalCode
        addrssIdLabel.text = address.datasetid
        latLabel.text = "\(address.lattitude)"
        longLabel.text = "\(address.longitude)"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
