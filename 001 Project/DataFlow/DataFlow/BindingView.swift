//
//  BindingView.swift
//  DataFlow
//
//  Created by Bunti Nizama on 15/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct BindingView: View {
    @State var displayTrue : Bool = false
    var body: some View {
        VStack {
            if displayTrue == true {
                Text("Hello, World! : True")
            } else {
                Text("Hello, World! : false")
            }
            ButtonForScreen1(displayTrueforbutton: $displayTrue)
            
        }
    }
}


struct ButtonForScreen1:View {
    @Binding var displayTrueforbutton : Bool
    var body: some View {
        Button(action: {
            self.displayTrueforbutton.toggle()
        }) {
            Text("Change Display")
        }
    }
}


struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}
