//
//  ContentView.swift
//  SwiftUICodeData
//
//  Created by Bunti Nizama on 25/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(entity : Student.entity() ,sortDescriptors : []) var students : FetchedResults<Student>
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
