//
//  ForEachRange.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct ForEachRange: View {
    
    var array: [String]
    
    var body: some View {
         List {
                      ForEach(0..<array.count) { x in
                          Text(self.array[x])
                      }
                  }
    }
}

struct ForEachRange_Previews: PreviewProvider {
    static var previews: some View {
        ForEachRange(array: [])
    }
}
