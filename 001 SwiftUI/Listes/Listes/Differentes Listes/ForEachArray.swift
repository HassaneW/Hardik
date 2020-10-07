//
//  ForEachArray.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct ForEachArray: View {
    
    var array : [String]
    
    var body: some View {
        List{
            ForEach(array, id: \.self) { a in
                HStack{
                    Spacer()
                    
                    Text(a)
                        .foregroundColor(.white)
                        .font(.title)
                    Spacer()
                }
                .background(Color.red)
            .cornerRadius(25)
            .padding()
            }
        }
    }
}

struct ForEachArray_Previews: PreviewProvider {
    static var previews: some View {
        ForEachArray(array: [])
    }
}
