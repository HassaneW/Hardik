//
//  TabBarView.swift
//  MatroParis_New
//
//  Created by Bunti Nizama on 07/10/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
     @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        TabView {
           ContentView().environment(\.managedObjectContext, managedObjectContext)
             .tabItem {
                Image(systemName: "phone.fill")
                Text("Article")
           }
            
            BookSearchView()
            .tabItem {
                 Image(systemName: "phone.fill")
                 Text("Book")
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

struct RedView: View {
    var body: some View {
        Color.red
    }
}

struct BlueView: View {
    var body: some View {
        Color.blue
    }
}
