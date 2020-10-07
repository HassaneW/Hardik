//
//  ViewController.swift
//  Masque_Ouverture_Twitter
//
//  Created by Wandianga on 8/6/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    @IBOutlet weak var monBackground : UIImageView!
    @IBOutlet weak var bouton : UIButton!

    var masque : CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ajouterMasque()
        setup()
    }
    
    @IBAction func boutonAction(_ sender: Any) {
        if masque != nil {
            masque?.add(animer(), forKey: "bounds")
            
        } else {
            setup()
        }
    }
    
    func setup() {
        ajouterMasque()
        bouton.setTitle("Animer", for: .normal)
    }

    func ajouterMasque() {
        masque = CALayer()
        masque?.contents = UIImage(named: "codabee")!.cgImage
        masque?.bounds = CGRect(x: 0, y: 0, width: 300, height: 200)
        masque?.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        monBackground.layer.mask = masque
        view.backgroundColor = .black
    }
    
    func animer() -> CAKeyframeAnimation {
        let kfa = CAKeyframeAnimation(keyPath: "bounds")
        kfa.duration = 1
        // lent au debut puis accélére  
        kfa.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)]
        if let taille = masque?.bounds {
            let largeur = taille.width
            let hauteur = taille.height
            
            // Taille de départ
            let tailleDeDepart = taille
            
            // Taille réduite
            let tailleReduite = CGRect(x: 0, y: 0, width: largeur * 0.8, height: hauteur * 0.8)
            // Taille Géante
            let tailleGeante = CGRect(x: 0, y: 0, width: 30000, height: 25000)
            
            kfa.values = [tailleDeDepart, tailleReduite, tailleGeante]
        }
        // Attribuer des valeurs temps dans l'animation
        kfa.keyTimes = [0, 0.25, 1]
        // Ne pas revenir à sa forme de base (animation)
        kfa.isRemovedOnCompletion = false
        
        kfa.fillMode = CAMediaTimingFillMode.forwards
        
        kfa.delegate = self
        
        return kfa
    }
    // Supprimer mon masque
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        masque?.removeFromSuperlayer()
        masque = nil
        bouton.setTitle("Remise a zero", for: .normal)
    }

}

