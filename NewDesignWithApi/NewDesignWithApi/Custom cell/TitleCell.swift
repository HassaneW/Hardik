//
//  TitleCell.swift
//  NewDesignWithApi
//
//  Created by Bunti Nizama on 08/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {
    @IBOutlet weak var titleLabel : UILabel!
    
   
    func setData(association : Association) {
        titleLabel.text = association.titre
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
