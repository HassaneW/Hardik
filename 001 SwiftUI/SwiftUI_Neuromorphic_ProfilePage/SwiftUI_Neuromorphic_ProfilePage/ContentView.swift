//
//  ContentView.swift
//  SwiftUI_Neuromorphic_ProfilePage
//
//  Created by Bunti Nizama on 05/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Button(action: {
                    
                }) {
                    Image(systemName: "1")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                }
                
                Text("Profile").font(.title)
                Spacer(minLength: 0)
                Button(action: {
                    
                }) {
                    Text("add")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color("Color"))
                        .cornerRadius(10)
                }
                
            }
            .padding()
            HStack{
                VStack{
                    Rectangle()
                    .fill(Color("Color"))
                    .frame(width: 100, height: 3)
                    
                    
                    Image("profile")
                    .resizable()
                    .frame(width: 100, height: 100)
                        .padding(.top,6)
                        .padding(.bottom,4)
                        .padding(.horizontal,8)
                    .background(Color("Color1"))
                }
            }
        }.background(Color.white).edgesIgnoringSafeArea(.all)
    }
}
