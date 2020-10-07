//
//  EnvironmentObjectView.swift
//  DataFlow
//
//  Created by Bunti Nizama on 15/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct EnvironmentObjectView: View  {
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.settings.score += 1
                }) {
                    Text("Increase Score")
                }
                
                NavigationLink(destination: DetailView()) {
                    Text("Show Detail View")
                }
            }
        }
    }
}

struct DetailView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        
        VStack{
            Text("Score: \(settings.score)")
            
            NavigationLink(destination: DetailView1()) {
                Text("Show Detail View")
            }
        }
    }
}

struct DetailView1: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        Text("Score: \(settings.score)")
    }
}




class UserSettings: ObservableObject {
    @Published var score = 0
}


struct EnvironmentObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
