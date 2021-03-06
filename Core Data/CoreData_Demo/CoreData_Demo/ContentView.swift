//
//  ContentView.swift
//  CoreData_Demo
//
//  Created by Wandianga on 8/25/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            Text("Count: \(books.count)")
                .navigationBarTitle("Bookworm")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.showingAddScreen.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
            )
                .sheet(isPresented: $showingAddScreen) { AddBookView().environment(\.managedObjectContext, self.moc)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
