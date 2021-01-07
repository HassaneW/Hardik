//
//  ContentView.swift
//  NewyorkTimesApi
//
//  Created by Bunti Nizama on 09/10/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("Search...", text: $searchText)
                NavigationLink(destination: ArticleSearchView(searchText: searchText) ) {
                    Text("Search Article")
                    .padding(20)
                }
                
                NavigationLink(destination: ArticleSearchView(searchText: searchText) ) {
                    Text("Books")
                    .padding(20)
                }
                
            }
        .padding(20)
        .navigationBarTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
