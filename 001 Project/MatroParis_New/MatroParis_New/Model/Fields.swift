/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Fields : Codable {
	let jour_fermeture : String?
	let nom_commerce : String?
	let adresse_livraison : String?
	let coord_geo : [Double]?
	let code_postal_livraison : Int?
	let commune_livraison : String?
    let indices_commerciaux : String?
    let noms_des_fichiers : Noms_des_fichiers?
    
    let x : Int?
    let annoncevisuellesituationsperturbees : Int?
    let annoncesonoreprochainpassage : Int?
    let stif : Int?
    let idptar : String?
    let coord : [Double]?
    let accessibilitequaitrain : Int?
    let paqt : Int?
    let annoncevisuelleprochainpassage : Int?
    let y : Int?
    let annoncesonoresituationsperturbees : Int?
    let codeinsee : Int?
    let nomptar : String?
    let ufr : Int?
    let idamivif : String?
    
     
    

    let  gestionnaire : String?
    let  hors_zone_controlee_station : String?
    let  ligne : String?
    let  accessible_au_public : String?
    let  tarif_gratuit_payant : String?
    let  localisation : String?
    let  station : String?
    let  accessibilite_pmr : String?
    let  acces_bouton_poussoir : String?


	enum CodingKeys: String, CodingKey {

		case jour_fermeture = "jour_fermeture"
		case nom_commerce = "nom_commerce"
		case adresse_livraison = "adresse_livraison"
		case coord_geo = "coord_geo"
		case code_postal_livraison = "code_postal_livraison"
		case commune_livraison = "commune_livraison"
        case indices_commerciaux = "indices_commerciaux"
        case noms_des_fichiers = "noms_des_fichiers"
        
        case x = "x"
            case annoncevisuellesituationsperturbees = "annoncevisuellesituationsperturbees"
            case annoncesonoreprochainpassage = "annoncesonoreprochainpassage"
            case stif = "stif"
            case idptar = "idptar"
            case coord = "coord"
            case accessibilitequaitrain = "accessibilitequaitrain"
            case paqt = "paqt"
            case annoncevisuelleprochainpassage = "annoncevisuelleprochainpassage"
            case y = "y"
            case annoncesonoresituationsperturbees = "annoncesonoresituationsperturbees"
            case codeinsee = "codeinsee"
            case nomptar = "nomptar"
            case ufr = "ufr"
            case idamivif = "idamivif"
        
            case gestionnaire = "gestionnaire"
            case hors_zone_controlee_station = "hors_zone_controlee_station"
            case ligne = "ligne"
            case accessible_au_public = "accessible_au_public"
            case tarif_gratuit_payant = "tarif_gratuit_payant"
            case localisation = "localisation"
            case station = "station"
            case accessibilite_pmr = "accessibilite_pmr"
            case acces_bouton_poussoir = "acces_bouton_poussoir"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		jour_fermeture = try values.decodeIfPresent(String.self, forKey: .jour_fermeture)
		nom_commerce = try values.decodeIfPresent(String.self, forKey: .nom_commerce)
		adresse_livraison = try values.decodeIfPresent(String.self, forKey: .adresse_livraison)
		coord_geo = try values.decodeIfPresent([Double].self, forKey: .coord_geo)
		code_postal_livraison = try values.decodeIfPresent(Int.self, forKey: .code_postal_livraison)
		commune_livraison = try values.decodeIfPresent(String.self, forKey: .commune_livraison)
        
        indices_commerciaux = try values.decodeIfPresent(String.self, forKey: .indices_commerciaux)
            noms_des_fichiers = try values.decodeIfPresent(Noms_des_fichiers.self, forKey: .noms_des_fichiers)
        
        x = try values.decodeIfPresent(Int.self, forKey: .x)
        annoncevisuellesituationsperturbees = try values.decodeIfPresent(Int.self, forKey: .annoncevisuellesituationsperturbees)
        annoncesonoreprochainpassage = try values.decodeIfPresent(Int.self, forKey: .annoncesonoreprochainpassage)
        stif = try values.decodeIfPresent(Int.self, forKey: .stif)
        idptar = try values.decodeIfPresent(String.self, forKey: .idptar)
        coord = try values.decodeIfPresent([Double].self, forKey: .coord)
        accessibilitequaitrain = try values.decodeIfPresent(Int.self, forKey: .accessibilitequaitrain)
        paqt = try values.decodeIfPresent(Int.self, forKey: .paqt)
        annoncevisuelleprochainpassage = try values.decodeIfPresent(Int.self, forKey: .annoncevisuelleprochainpassage)
        y = try values.decodeIfPresent(Int.self, forKey: .y)
        annoncesonoresituationsperturbees = try values.decodeIfPresent(Int.self, forKey: .annoncesonoresituationsperturbees)
        codeinsee = try values.decodeIfPresent(Int.self, forKey: .codeinsee)
        nomptar = try values.decodeIfPresent(String.self, forKey: .nomptar)
        ufr = try values.decodeIfPresent(Int.self, forKey: .ufr)
        idamivif = try values.decodeIfPresent(String.self, forKey: .idamivif)
        
        gestionnaire = try values.decodeIfPresent(String.self, forKey: .gestionnaire)
        hors_zone_controlee_station = try values.decodeIfPresent(String.self, forKey: .hors_zone_controlee_station)
        ligne = try values.decodeIfPresent(String.self, forKey: .ligne)
        accessible_au_public = try values.decodeIfPresent(String.self, forKey: .accessible_au_public)
        tarif_gratuit_payant = try values.decodeIfPresent(String.self, forKey: .tarif_gratuit_payant)
        localisation = try values.decodeIfPresent(String.self, forKey: .localisation)
        station = try values.decodeIfPresent(String.self, forKey: .station)
        accessibilite_pmr = try values.decodeIfPresent(String.self, forKey: .accessibilite_pmr)
        acces_bouton_poussoir = try values.decodeIfPresent(String.self, forKey: .acces_bouton_poussoir)
	}

}
