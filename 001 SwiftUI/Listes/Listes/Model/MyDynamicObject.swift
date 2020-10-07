//
//  MyDynamicObject.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MyDynamicObject: View {
    
    var array : [Person]
    
    var body: some View {
        List(array, id: \.id, rowContent: { person in
            
                HStack {
                      Text(person.surname)
                     Text(person.name)
                    Spacer()
                    Text("\(person.age) ans")
                }
            
          
        })
    }
}

struct MyDynamicObject_Previews: PreviewProvider {
    static var previews: some View {
        MyDynamicObject(array: [])
    }
}
