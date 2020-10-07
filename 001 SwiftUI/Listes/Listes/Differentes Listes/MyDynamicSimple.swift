//
//  MyDynamicSimple.swift
//  Listes
//
//  Created by Wandianga on 8/11/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MyDynamicSimple: View {
    
    var langArray: [String]
    
    var body: some View {
        List(langArray, id: \.self) { lang in
            Text(lang)
            
        }
    }
}

struct MyDynamicSimple_Previews: PreviewProvider {
    static var previews: some View {
        MyDynamicSimple(langArray: [])
    }
}
