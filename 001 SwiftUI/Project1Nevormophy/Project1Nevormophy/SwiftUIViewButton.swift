//
//  SwiftUIViewButton.swift
//  Project1Nevormophy
//
//  Created by Bunti Nizama on 01/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//api : https://jsonplaceholder.typicode.com/posts

import SwiftUI

struct SwiftUIViewButton: View {
    var body: some View {
        VStack {
            Text("Button")
                
                .onTapGesture {
                    Api().getPosts()
            }
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: 200, height: 60)
            .background(
                ZStack {
                    Color(#colorLiteral(red: 0.4938853979, green: 0.5476876497, blue: 0.6575545669, alpha: 0.5))
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(.white)
                        .blur(radius: 4)
                        .offset(x: -4, y: -4)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        //.foregroundColor(Color(#colorLiteral(red: 0.4938853979, green: 0.5476876497, blue: 0.6575545669, alpha: 0.5)))
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4938853979, green: 0.5476876497, blue: 0.6575545669, alpha: 0.5)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                        .padding(2)
                        .blur(radius: 2)
                }
            )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                
                .shadow(color: Color(#colorLiteral(red: 0.4938853979, green: 0.5476876497, blue: 0.6575545669, alpha: 0.5)), radius: 20, x: 20, y: 20)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct SwiftUIViewButton_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewButton()
    }
}
