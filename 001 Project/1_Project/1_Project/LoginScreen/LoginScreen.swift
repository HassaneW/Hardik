//
//  LoginScreen.swift
//  1_Project
//
//  Created by Bunti Nizama on 13/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct LoginScreen: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State var user = ""
    @State var pass = ""
    @State private var willMoveToNextScreen = false
    var body: some View {
//        Text("Hello, World!")
        NavigationView {
        ZStack{
            Color("Color").edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                //Logo
                VStack(spacing: 0) {
                    Image("logo")
                }
                .padding(10)
                .modifier(TopModifier())
                .padding(.bottom , 20)
                
                //Email
                HStack{
                    Image(systemName:"envelope.fill").foregroundColor(Color.gray)
                    
                    TextField("Email",text : self.$user)
                }
                .modifier(TFModifier())
             
                //Password
                HStack{
                    Image(systemName:"lock.fill").foregroundColor(Color.gray)
                    
                    SecureField("Password",text : self.$pass)
                    
                    Button(action:{
                        
                    } ){
                        Image(systemName:"eye.slash.fill").foregroundColor(Color.gray)
                    }
                }
                .modifier(TFModifier())
                
                //Login Button
                Button(action:{
                    print("emial :\(self.user)")
                    print("password :\(self.pass)")
                    self.willMoveToNextScreen = true
                    
                } ){
                     NavigationLink(destination: ProfileScreen() ) {
                    Text("Login")
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                    }
                }
                .buttonStyle(ButtonModifier())
                
                
                Text("(OR)")
                .foregroundColor(Color.gray)
                    .padding(0)
                HStack(spacing: 10){
                    
                
                Button(action: {
                    
                }, label: {
                    Image("facebook")
                        .renderingMode(.original)
                    .padding(10)
                    
                })
                    .buttonStyle(OtherModifier())
                    
                    Button(action: {
                        
                    }, label: {
                        Image("twitter")
                            .renderingMode(.original)
                        .padding(10)
                        
                    })
                    .buttonStyle(OtherModifier())
                    
                    Button(action: {
                        
                    }, label: {
                        Image("instagram")
                            .renderingMode(.original)
                        .padding(10)
                        
                    })
                    .buttonStyle(OtherModifier())
                    
                }

                
            }
            .padding(.horizontal,20)
        }
        }
        .navigate(to: ProfileScreen().environment(\.managedObjectContext, self.managedObjectContext), when: $willMoveToNextScreen)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

struct TopModifier : ViewModifier {
    func body(content: Content) -> some View {
        content.background(Color("Color"))
        .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 6, x: 8, y: 8)
         .shadow(color: Color.white.opacity(0.5), radius: 6, x: -8, y: -8)
    }
}

struct TFModifier : ViewModifier {
    func body(content: Content) -> some View {
        content.padding(15).background(Color("Color"))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
            .stroke(Color.black.opacity(0.04),lineWidth: 4)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
        )}
}

struct ButtonModifier : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .background(Color("Color"))
        .cornerRadius(15)
        .overlay(
            VStack{
                if configuration.isPressed {
                    RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black.opacity(0.05),lineWidth: 4)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
        )
        .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 3, x: 5, y: 5)
       .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.6), radius: 3, x: -5, y: -5)
        
    }
}


struct OtherModifier : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .background(Color("Color"))
        .clipShape(Circle())
            
        .overlay(
            VStack{
                if configuration.isPressed {
                    Circle()
                    .stroke(Color.black.opacity(0.05),lineWidth: 4)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 5, y: 5)
                     .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: -5, y: -5)
                    .clipShape(Circle())
                }
            }
        )
        .shadow(color: Color.black.opacity(configuration.isPressed ? 0 : 0.2), radius: 3, x: 5, y: 5)
        .shadow(color: Color.white.opacity(configuration.isPressed ? 0 : 0.6), radius: 3, x: -5, y: -5)
        
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
