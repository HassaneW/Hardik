//
//  DetailViewController.swift
//  NewDesignWithApi
//
//  Created by Bunti Nizama on 08/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var id_associationLabel  : UILabel!
    @IBOutlet weak var titreLabel : UILabel!
     @IBOutlet weak var titre2Label : UILabel!
    @IBOutlet weak var date_creationLabel  : UILabel!
    @IBOutlet weak var adresse_type_voieLabel  : UILabel!
     @IBOutlet weak var adresse_libelle_voieLabel  : UILabel!
    var selectedAccociation = Association()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        titreLabel.text = selectedAccociation.titre
        titre2Label.text = selectedAccociation.titre
        id_associationLabel.text = selectedAccociation.id_association
        date_creationLabel.text = selectedAccociation.date_creation
        adresse_libelle_voieLabel.text = selectedAccociation.adresse_libelle_voie
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
