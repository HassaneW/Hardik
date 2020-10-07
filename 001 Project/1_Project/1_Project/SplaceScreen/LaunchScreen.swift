//
//  SplaceScreen.swift
//  1_Project
//
//  Created by Bunti Nizama on 10/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct LaunchScreen:View {
    static let maxSize = 1.7
    static let minSize = 0.5
    @State var scale: CGFloat = 1
     @Environment(\.managedObjectContext) var managedObjectContext
    @State private var willMoveToNextScreen = false

    var image :Image
    var body: some View {
           NavigationView {
        ZStack{
            Color.lairLightGray
                .edgesIgnoringSafeArea(.all)
            VStack {
                //This is Label
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(10)
                    .onTapGesture {
                        let baseAnimation = Animation.easeInOut(duration: 2)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            // your code here
                             DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                self.willMoveToNextScreen.toggle()
                            }
                            return withAnimation(baseAnimation) {
                               self.scale = 0
                           }
                            
                        }
                        return withAnimation(baseAnimation) {
                            self.scale = 0.8
                        }
           
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(LinearGradient.lairDiagonalDarkBorder, lineWidth: 2)
            )
                .background(Color.gray)
                .cornerRadius(15)
                .shadow(color: Color.gray.opacity(0.5), radius: 14, x: -14, y: -14)
                .shadow(color: Color.gray.opacity(0.5), radius: 14, x: 14, y: 14)
                .scaleEffect(scale)
                .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 2)
                    return withAnimation(baseAnimation) {
                        self.scale = CGFloat(LaunchScreen.minSize)
                    }
            }
            
        }
    }
          .navigate(to: TabBarScreen_LVMH().environment(\.managedObjectContext, self.managedObjectContext), when: $willMoveToNextScreen)
}
    
    
    func goToTabScreen(){
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = UIHostingController(rootView:  TabBarScreen_LVMH().environment(\.managedObjectContext, managedObjectContext))
    }
    
    func goToLoginScreen(){
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        sceneDelegate?.window?.rootViewController = UIHostingController(rootView:  TabBarScreen_LVMH().environment(\.managedObjectContext, managedObjectContext))
    }
}


struct SplaceScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen(image: Image("logo"))
    }
}
