//
//  ViewController.swift
//  load
//
//  Created by Wandianga on 8/6/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customLoadingView : CustomLoadingView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customLoadingView.initialiserShape()
    }

}

