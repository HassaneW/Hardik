//
//  MyStatic.swift
//  Listes
//
//  Created by Wandianga on 8/11/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MyStatic: View {
    var body: some View {
       List{
            
            // List Statique limitée à 10 éléments
            
            Text("Mon 1er élément")
            HStack{
                Image(systemName: "paperplane")
                Text("Mon second élément")
            }
            Text("Mon 3eme")
                .font(.largeTitle)
            .frame(height: 300)
                .background(Color.red)
            Text("Mon 4 eme")
            
        }
    }
}

struct MyStatic_Previews: PreviewProvider {
    static var previews: some View {
        MyStatic()
    }
}
