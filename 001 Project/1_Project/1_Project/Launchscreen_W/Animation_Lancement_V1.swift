//
//  Animation_Lancement.swift
//  Final_Demo_LVMH
//
//  Created by Wandianga on 9/1/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct Animation_Lancement: View {
    static let maxSize = 1.5
    static let minSize = 0.5
    @State var logoSize = UIScreen.main.bounds.width * CGFloat(Animation_Lancement.maxSize)
    @State var scale : CGFloat = 1
    
    var body: some View {
        ZStack {
            
            
            
            Color.white
                .edgesIgnoringSafeArea(.all)
            Image("Logo_LVMH")
                .resizable()
                
                .aspectRatio(contentMode: .fit)
                
                .frame(width: logoSize, height: logoSize, alignment: .center)
                
                .animation(.default)
                .scaleEffect(scale)
                .onTapGesture {
                    
                    let baseAnimation = Animation.easeInOut(duration: 2)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        
                        return withAnimation(baseAnimation) {
                            self.scale = 0
                        }
                        
                    }
                    return withAnimation(baseAnimation) {
                        self.scale = 0.8
                    }
            }
        }
            
        .onAppear {
            let baseAnimation = Animation.easeInOut(duration: 2)
            return withAnimation(baseAnimation) {
                self.scale = CGFloat(Animation_Lancement.minSize)
                
            }
        }
    }
}

struct Animation_Lancement_Previews: PreviewProvider {
    static var previews: some View {
        Animation_Lancement()
    }
}
