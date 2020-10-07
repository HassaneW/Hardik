//
//  TitleCell.swift
//  RecipleaseV1
//
//  Created by Wandianga on 9/10/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit

// tab bar search / favoris
// search
// lecran resultats avec custom cell
// l ecran detail resultats

class TitleCell: UITableViewCell {

    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ingridiantsLabel: UILabel!
    
//    func setData(reciplease: Reciplease) {
//        titleLabel.text = reciplease.hits[0].recipe.title
//    }
//    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayData(recipt : Recipe) {
        titleLabel.text = recipt.title
        descriptionLabel.text = recipt.url
        timeLabel.text = "Time : \(recipt.totalTime)"
        ingridiantsLabel.text = recipt.ingredients.first
        
        
              guard let urlIcon = URL.init(string: recipt.imageUrl)  else { return }
              DispatchQueue.global().async { [weak self] in
                  if let data = try? Data(contentsOf: urlIcon) {
                      let image = UIImage.init(data: data)
                      DispatchQueue.main.async {
                        self?.imgView.image = image
                      }
                  }
              }
    }

}
