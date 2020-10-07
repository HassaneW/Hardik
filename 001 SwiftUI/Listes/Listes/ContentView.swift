//
//  ContentView.swift
//  Listes
//
//  Created by Wandianga on 8/11/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State  var langArray: [String] = ["Swift", "Objectif-C", "Dart", "Java", "Kotlin", "Python", "Ruby", "Haskell", "Cobol"]
    
    var persons : [Person] = [
        
        Person(name: "Codabee", surname: "Hassane", age: 39),
        Person(name: "Jobs", surname: "Steve", age: 34),
        Person(name: "Nadal", surname: "Rafa", age: 32),
        Person(name: "Brady", surname: "Tom", age: 42),
        Person(name: "Le chat", surname: "Athena", age: 1)
        
    ]
    
    var body: some View {
        
        NavigationView {
            
//            Form {
//
//                Section(header: Text("One")) {
//                    Text("A")
//                    Text("B ")
//                }
//
//                Section(header: Text("One")) {
//                    Text("A")
//                    Text("B ")
//                }
//            }
            
            MyListDelete(langArray: $langArray)
            

                .navigationBarTitle("Listes")
                .navigationBarItems(
                    leading: Image(systemName: "paperclip"), trailing: EditButton()
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
