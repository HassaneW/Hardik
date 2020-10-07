//
//  MyScroll.swift
//  Listes
//
//  Created by Wandianga on 8/11/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MyScroll: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Hello, World!")
                    .frame(width: 300,height: 200)
                    .background(Color.yellow)
                    .padding()
                
                Text("Hello, World!")
                    .frame(width: 300,height: 200)
                    .background(Color.yellow)
                    .padding()
                
                Text("Hello, World!")
                    .frame(width: 300,height: 200)
                    .background(Color.yellow)
                    .padding()
                
                Text("Hello, World!")
                    .frame(width: 300,height: 200)
                    .background(Color.yellow)
                    .padding()
                
                Text("Hello, World!")
                    .frame(width: 300,height: 200)
                    .background(Color.yellow)
                    .padding()
            }
        }
    }
}

struct MyScroll_Previews: PreviewProvider {
    static var previews: some View {
        MyScroll()
    }
}
