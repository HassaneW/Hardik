//
//  MyDynamicRange.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MyDynamicRange: View {
    
    var array : [String]
    
    var body: some View {
            List(0..<array.count, rowContent: { index in
                    HStack{
                        Text("\(index + 1)")
                        .foregroundColor(.blue)
                        Text(self.array[index])
                            
                    }
                })
    }
}

struct MyDynamicRange_Previews: PreviewProvider {
    static var previews: some View {
        MyDynamicRange(array: [])
    }
}
