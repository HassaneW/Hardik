//
//  TabViewController.swift
//  tabBarExample
//
//  Created by Bunti Nizama on 24/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
}

extension TabViewController : UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("selected :\(item.title!)")
    }
}
