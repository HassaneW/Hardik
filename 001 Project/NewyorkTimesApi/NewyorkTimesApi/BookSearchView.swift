//
//  BookSearchView.swift
//  NewyorkTimesApi
//
//  Created by Bunti Nizama on 09/10/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import SwiftUI

struct BookSearchView: View {
      @State var searchText = ""
      var body: some View {
          NavigationView {
              ScrollView {
                  TextField("Search...", text: $searchText)
                
                  
                  NavigationLink(destination: BooksListView(searchText: searchText) ) {
                      Text("Books")
                      .padding(20)
                  }
                  
              }
          .padding(20)
          .navigationBarTitle("Home")
          }
      }
}

struct BookSearchView_Previews: PreviewProvider {
    static var previews: some View {
        BookSearchView()
    }
}
