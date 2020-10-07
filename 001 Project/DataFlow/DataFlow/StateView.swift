//
//  StateView.swift
//  DataFlow
//
//  Created by Bunti Nizama on 15/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct StateView: View {
     @State var displayTrue : Bool = false
        var body: some View {
            VStack {
            if displayTrue == true {
                 Text("Hello, World! : True")
            } else {
                Text("Hello, World! : false")
            }
          
            Button(action: {
                           self.displayTrue.toggle()
                       }) {
                           Text("Change Display")
                       }
            }
        }
    }

    struct StateView_Previews: PreviewProvider {
        static var previews: some View {
            StateView()
        }
    }
