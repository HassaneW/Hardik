//
//  Animation_Lancement_V2.swift
//  Final_Demo_LVMH
//
//  Created by Wandianga on 9/1/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct Animation_Lancement_V2: View {
    static let maxSize = 1.7
    static let minSize = 0.8
    
    @State var scale : CGFloat = 1
    var image : Image
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .onTapGesture {
                        let baseAnimation = Animation.easeInOut(duration: 2)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            
                            return withAnimation(baseAnimation) {
                                self.scale = 0
                            }
                            
                        }
                        return withAnimation(baseAnimation) {
                            self.scale = 1
                        }
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(LinearGradient.lairDiagonalDarkBorder, lineWidth: 2)
            )
                .background(Color.white)
                .cornerRadius(15)
                
//                .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 8, y: 8)
                
                .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
                .scaleEffect(scale)
                .onAppear{
                    let baseAnimation = Animation.easeInOut(duration: 2)
                    return withAnimation(baseAnimation) {
                        self.scale = CGFloat(Animation_Lancement_V2.minSize)
                        
                    }
            }
        }
    }
    
    // Passage de l'animation au tabBAR
    
    //     func goToTabScreen(){
    //           let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    //           sceneDelegate?.window?.rootViewController = UIHostingController(rootView: TabBarScreen())
    //       }
    
}

struct Animation_Lancement_V2_Previews: PreviewProvider {
    static var previews: some View {
        Animation_Lancement_V2(image: Image("Logo_LVMH"))
    }
}
