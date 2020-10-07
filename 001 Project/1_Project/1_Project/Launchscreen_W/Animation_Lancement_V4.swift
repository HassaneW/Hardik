//
//  Animation_Lancement_V4.swift
//  Final_Demo_LVMH
//
//  Created by Wandianga on 9/1/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct Animation_Lancement_V4: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    static let maxSize = 1.5
    static let minSize = 0.5
    @State var logoSize = UIScreen.main.bounds.width * CGFloat(Animation_Lancement.maxSize)
    
    @State var scale : CGFloat = 1
    
    @State var show = false
     @State private var willMoveToNextScreen = false
    var body: some View {
        
        NavigationView {
        ZStack {
            Image("logo")
                
                .resizable()
                
                .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 1.5)
                .clipShape(Rectangle())
                .padding()
                .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 10, x: 9, y: 9)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 10, x: -9, y: -9)
        }.clipShape(Rectangle().inset(by: 6))
            .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 8, x: 9, y: 9)
            .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 8, x: -9, y: -9)
            
            .padding()
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            .animation(.default)
            .scaleEffect(scale)
            
            
            .onTapGesture {
                
                let baseAnimation = Animation.easeInOut(duration: 2)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    
                    
                     DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.willMoveToNextScreen = true
                    }
                    return withAnimation(baseAnimation) {
                        self.scale = 0
                         
                     
                    }                    
                }
        }
//        .background(Color(#colorLiteral(red: 0.8331035057, green: 0.8391294769, blue: 0.8547315138, alpha: 0.3671339897)))
             .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            
        }
         .navigate(to: TabBarScreen_LVMH().environment(\.managedObjectContext, self.managedObjectContext), when: $willMoveToNextScreen)
        
    }
    
    func goToTabScreen() {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        sceneDelegate?.window?.rootViewController = UIHostingController(rootView: TabBarScreen_LVMH().environment(\.managedObjectContext, self.managedObjectContext))
    }
    
//    func goToLoginScreen() {
//           let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//           
//           sceneDelegate?.window?.rootViewController = UIHostingController(rootView: LoginScreen())
//       }
//    
}

struct Animation_Lancement_V4_Previews: PreviewProvider {
    static var previews: some View {
        Animation_Lancement_V4()
    }
}

