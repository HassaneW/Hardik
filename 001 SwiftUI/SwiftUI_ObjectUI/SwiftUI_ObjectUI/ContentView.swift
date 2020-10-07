//
//  ContentView.swift
//  SwiftUI_ObjectUI
//
//  Created by Bunti Nizama on 08/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        VStack {
            Item(title: "Test 1", image: Image(systemName: "lightbulb"))
            
            Item(title: "Test 2", image: Image("2"))
            
            
        }
        
        
            
        
       
    }

    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Item:View {
    var title :String
    var image :Image
      var body: some View {
            VStack {
                //This is Label
                Text(title)
                .bold()
                .padding(10)
                .foregroundColor(Color.black.opacity(0.7))
                
                LinearGradient.lairHorizontalDark
                .mask(image.resizable().scaledToFit())
                .frame(width: 100, height: 120)
                .padding(10)
                .font(.system(size: 100, weight: .thin))
                .shadow(color: .white, radius: 2, x: -3, y: -3)
                .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
                .clipped(antialiased: true)
                
                image
                .resizable()
                .aspectRatio(contentMode: .fit)
            
//                .cornerRadius(15)
                .shadow(color: Color(white: 1.0).opacity(0.9), radius: 18, x: -18, y: -18)
                .shadow(color: Color.lairShadowGray.opacity(0.5), radius: 14, x: 14, y: 14)
                .border(Color.blue, width: 3.0)
                
               
    //
            }
            .overlay(
              RoundedRectangle(cornerRadius: 15)
                .stroke(LinearGradient.lairDiagonalDarkBorder, lineWidth: 2)
            )
              .background(Color.lairBackgroundGray)
              .cornerRadius(15)
              .shadow(color: Color(white: 1.0).opacity(0.9), radius: 18, x: -18, y: -18)
              .shadow(color: Color.lairShadowGray.opacity(0.5), radius: 14, x: 14, y: 14)
            
           
        }
}


// MARK: - API
@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    public func foreground<Overlay: View>(_ overlay: Overlay) -> some View {
        self.overlay(overlay).mask(self)
    }
}
