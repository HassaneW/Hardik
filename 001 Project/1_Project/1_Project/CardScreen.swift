//
//  ContentView.swift
//  Shared
//
//  Created by Mohammad Azam on 7/21/20.
//

import SwiftUI

struct CardScreen: View {
    
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
    @State private var name: String = "Hardik Hadwani"
    @State private var expires: String = "12/12"
    @State private var cvv: String = "123"
    
    var body: some View {
        VStack {
            CreditCard {
                VStack {
                    Group {
                        if self.flipped {
                            CreditCardBack(cvv: self.cvv)
                        } else {
                            CreditCardFront(name: self.name, expires: self.expires)
                        }
                    }
                }.rotation3DEffect(
                    .degrees(self.degrees),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            }
            .onTapGesture {
                withAnimation {
                    self.degrees += 180
                    self.flipped.toggle()
                }
            }
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.top,.leading,.trailing])
            
            TextField("Expiration", text: $expires)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading,.trailing])
            TextField("CVV", text: $cvv)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.leading,.trailing])
//            TextField("CVV", text: $cvv) { (editingChanged) in
//                withAnimation {
//                    degrees += 180
//                    flipped.toggle()
//                }
//            } //onCommit: {}
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding([.leading,.trailing])
            
        }
    }
}

struct CardScreen_Previews: PreviewProvider {
    static var previews: some View {
        CardScreen()
    }
}

