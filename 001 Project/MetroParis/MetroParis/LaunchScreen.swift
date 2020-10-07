//
//  ContentView.swift
//  MetroParis
//
//  Created by Bunti Nizama on 28/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}


struct LaunchScreen: View {
    // 1.
    @State private var startAnimation: Bool = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var willMoveToNextScreen = false
    
    var body: some View {
        NavigationView{
            VStack {
                // 2.
                Button("Start Animation") {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.startAnimation.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.willMoveToNextScreen.toggle()
                    }
                }
                HStack {
                    Spacer()
                    // 3.
                    Text("🚚")
                        .font(.custom("Arial", size: 100))
                        // 4.
                        .offset(x: self.startAnimation ? 0 - UIScreen.main.bounds.width + 100: 0)
                }
            }
        }
        .navigate(to: TabViewMetro().environment(\.managedObjectContext, self.managedObjectContext), when: $willMoveToNextScreen)
    }
}



extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigateModifier(destination: view, binding: binding))
    }
}


// MARK: - NavigateModifier
fileprivate struct NavigateModifier<SomeView: View>: ViewModifier {

    // MARK: Private properties
    fileprivate let destination: SomeView
    @Binding fileprivate var binding: Bool


    // MARK: - View body
    fileprivate func body(content: Content) -> some View {
        NavigationView {
            ZStack {
                content
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(destination: destination
                    .navigationBarTitle("")
                    .navigationBarHidden(true),
                               isActive: $binding) {
                    EmptyView()
                }
            }
        }
    }
}