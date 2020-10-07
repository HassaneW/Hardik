//
//  Person.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import Foundation


struct Person : Identifiable {
    
    var id = UUID()
    var name : String
    var surname: String
    var age: Int
}
