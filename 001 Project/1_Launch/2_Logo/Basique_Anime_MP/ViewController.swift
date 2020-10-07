//
//  ViewController.swift
//  Basique_Anime_MP
//
//  Created by Wandianga on 8/2/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var patateImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // A la base notre image est carré, centréet elle a un alpha de 0
        
        // L'animation dure 3s à la fin notre image est arrondi, avec un alpha se 1, et va descendre de 150
        
        self.patateImg.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Image ronde à carré en 3 seconde
        UIView.animate(withDuration: 3) {
            self.patateImg.layer.cornerRadius = self.patateImg.frame.width / 2
            self.patateImg.alpha = 1
            // Baisser l'image sur son sens Y
            self.patateImg.center.y += 150
        }
    }


}

