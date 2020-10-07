//
//  MyTabView.swift
//  La Navigation
//
//  Created by matthieu passerel on 03/10/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import SwiftUI

struct MyTabView: View {
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ContentView(departments: [])
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("One")
            }.tag(0)
//            NextView(text: "swiftUI")
//                .tabItem {
//                    Image(systemName: "chevron.left.slash.chevron.right")
//                    Text("Swift UI")
//            }.tag(1)
//            NextView(text: "swift")
//                .tabItem {
//                    Image(systemName: "pencil")
//                    Text("Swift")
//            }.tag(2)
//            NextView(text: "beeUI")
//                .tabItem {
//                    Image(systemName: "paperclip")
//                    Text("Bee UI")
//            }.tag(3)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
