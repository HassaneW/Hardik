//
//  Animation_Lancement_V3.swift
//  Final_Demo_LVMH
//
//  Created by Wandianga on 9/1/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct Animation_Lancement_V3: View {
    
    static let maxSize = 1.5
       static let minSize = 0.5
       @State var logoSize = UIScreen.main.bounds.width * CGFloat(Animation_Lancement.maxSize)
    
       @State var scale : CGFloat = 1
    
    var body: some View {
    
        
        
        VStack{
            
            
            LinearGradient.lairHorizontalDark
               .mask(Image( "Logo_LVMH")
                
                .resizable()
                .padding()
                .border(Color.yellow, width: 5)
                .scaledToFit())
                
              
                
//            .frame(width: 150, height: 236)
//                .frame(width: 250, height: 400, alignment: .center)
                
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                
            .padding(40)
                .font(.system(size: 150, weight: .heavy))
                .shadow(color: .white, radius: 2, x: -3, y: -3)
                .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
            
        }
    .overlay(
        RoundedRectangle(cornerRadius: 15)
            .stroke(LinearGradient .lairDiagonalDarkBorder, lineWidth: 2))
            
            .background(Color.lairBackgroundGray)
        .cornerRadius(15)
            .shadow(color: Color(.white).opacity(0.9), radius: 18, x: -18, y: -18)
            .shadow(color: Color.lairDarkGray.opacity(0.5), radius: 14, x: 14, y: 14)
        
        
        .animation(.default)
            .scaleEffect(scale)
           
//        .onAppear {
//                  let baseAnimation = Animation.easeInOut(duration: 2)
//                  return withAnimation(baseAnimation) {
//                    self.scale = CGFloat(Animation_Lancement_V3.minSize)
//
//                  }
//              }
        
                   .onTapGesture {
                                   
                    let baseAnimation = Animation.linear(duration: 2)
                                   DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                       
                                       return withAnimation(baseAnimation) {
                                           self.scale = 0
                                       }
                                       
                                   }
        //                           return withAnimation(baseAnimation) {
        //                               self.scale = 0.8
        //                           }
                           }.background(Color.lairBackgroundGray)
                    
        
        
    }
}

struct Animation_Lancement_V3_Previews: PreviewProvider {
    static var previews: some View {
        Animation_Lancement_V3()
    }
}
