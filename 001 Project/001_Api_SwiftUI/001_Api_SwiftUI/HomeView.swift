//
//  HomeView.swift
//  001_Api_SwiftUI
//
//  Created by Bunti Nizama on 24/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct HomeView: View {
     @Environment(\.managedObjectContext) var moc
    var body: some View {
        NavigationView{
            ScrollView(){
                NavigationLink(destination: ContentView().environment(\.managedObjectContext, self.moc) ) {
                    Text("List View").padding(20)
                }
                
                NavigationLink(destination: CollectioView().environment(\.managedObjectContext, self.moc) ) {
                    Text("Collection View").padding(20)
                }
                
                NavigationLink(destination: ContentView( isDisplayCodeData: true).environment(\.managedObjectContext, self.moc) ) {
                    Text("Core Data List").padding(20)
                }
            }
                
            .navigationBarTitle("Home")
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
