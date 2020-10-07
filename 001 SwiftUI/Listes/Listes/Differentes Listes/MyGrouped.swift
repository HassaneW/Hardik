//
//  MyGrouped.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MyGrouped: View {
    var body: some View {
       List{
            
            Section(header: Text("One")) {
                Text("A")
                Text("B ")
            }
            
            Section(header: Text("One")) {
                Text("A")
                Text("B ")
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct MyGrouped_Previews: PreviewProvider {
    static var previews: some View {
        MyGrouped()
    }
}
