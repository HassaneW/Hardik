//
//  TabView.swift
//  MetroParis
//
//  Created by Bunti Nizama on 28/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct TabViewMetro: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        TabView {
           ShopsView().environment(\.managedObjectContext, managedObjectContext)
             .tabItem {
                Image(systemName: "phone.fill")
                Text("Shops")
           }
            PictogrammeView().environment(\.managedObjectContext, managedObjectContext)
                        .tabItem {
                           Image(systemName: "phone.fill")
                           Text("Pictogramme")
                      }
            RATPView().environment(\.managedObjectContext, managedObjectContext)
               .tabItem {
                  Image(systemName: "tv.fill")
                  Text("RATP")
            }
            
            ToilettesView().environment(\.managedObjectContext, managedObjectContext)
               .tabItem {
                  Image(systemName: "tv.fill")
                  Text("Toilettes")
            }
            RedView()
               .tabItem {
                  Image(systemName: "tv.fill")
                  Text("Maps")
            }
            BlueView()
                          .tabItem {
                             Image(systemName: "tv.fill")
                             Text("Number")
                       }
        }
    }
}

struct TabViewMetro_Previews: PreviewProvider {
    static var previews: some View {
        TabViewMetro()
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


