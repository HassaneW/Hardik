//
//  ContentView.swift
//  La Navigation
//
//  Created by matthieu passerel on 03/10/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var selected = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                NavigationLink("Mon premier Nav Link", destination: NextView(text: "Youpi j'ai réussi"))
                NavigationLink(destination: NextView(text: "Avec Label")) {
                    HStack {
                        Image(systemName: "house.fill")
                        Text("Autre façon")
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(20)
                }
                Text("Navigation")
                NavigationLink(destination: NextView(text: "swiftUI")) {
                    ButtonBase(name: "swiftUI")
                }
                NavigationLink(destination: NextView(text: "swift")) {
                    ButtonBase(name: "swift")
                }
                NavigationLink(destination: NextView(text: "beeUI")) {
                    ButtonBase(name: "beeUI")
                }
                Text("Présentation")
                PresentationButton(show: $show, selected: $selected, name: "swiftUI")
                PresentationButton(show: $show, selected: $selected, name: "swift")
                PresentationButton(show: $show, selected: $selected, name: "beeUI")
                
                }.padding()
            .navigationBarItems(
                leading: Button(action: {
                    self.show.toggle()
                    self.selected = "paperplane.fill"
                }, label: {
                    Image(systemName: "paperplane.fill")
                }),
                trailing: NavigationLink("Options", destination: NextView(text: "house.fill"))
            )
            .navigationBarTitle("La Navigation")
                .sheet(isPresented: $show) {
                    NextView(text: self.selected)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
