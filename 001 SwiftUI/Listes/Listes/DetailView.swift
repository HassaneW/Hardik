//
//  DetailView.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var string : String
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Mon langage préféré est : ")
                .font(.title)
            Text(string)
                .foregroundColor(.blue)
                .font(.largeTitle)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(string: "Test String")
    }
}
