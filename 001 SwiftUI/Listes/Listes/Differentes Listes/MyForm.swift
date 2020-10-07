//
//  MyForm.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MyForm: View {
    var body: some View {
        Form {
            
            Section(header: Text("One")) {
                Text("A")
                Text("B ")
            }
            
            Section(header: Text("One")) {
                Text("A")
                Text("B ")
            }
        }
    }
}

struct MyForm_Previews: PreviewProvider {
    static var previews: some View {
        MyForm()
    }
}
