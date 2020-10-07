//
//  ContentView.swift
//  DataFlow
//
//  Created by Bunti Nizama on 15/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import Combine

class ResetPasswordModel: ObservableObject {
  @Published var email = ""
}
struct ContentView: View {
    @EnvironmentObject var settings: UserSettings

    @ObservedObject private var model = ResetPasswordModel()

    var body: some View {
        VStack {
        Form {
            Section { TextField("Email", text: $model.email) }
        }
            Button(action: {
                print("Email : \(self.model.email)")

                self.model.email = "changemodel@gmail.com"
                           }) {
                               Text("display email")
                           }
        }

    }
}

//
//You should do what you want in your ViewModel. Your view model is the TestModel class (which I suggest you rename it in TestViewModel). It's where you are supposed to put the logic between the model and the view. The ViewModel should prepare the model to be ready for the visualization. And that is the right place to put your combine logic (if it's related to the view, of course).
//
//Now we can use your specific example to actually make an example. To be honest there are a couple of slight different solutions depending on what you really want to achieve. But for now I'll try to be as generic as possible and then you can tell me if the solution is fine or it needs some refinements:

