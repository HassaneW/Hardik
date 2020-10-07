//
//  TabBar_Neuromorphic.swift
//  Final_Demo_LVMH
//
//  Created by Wandianga on 9/4/20.
//  Copyright © 2020 Wandianga. All rights reserved.


//https://blckbirds.com/post/how-to-navigate-between-views-in-swiftui-by-using-an-environmentobject/
//

import SwiftUI

struct TabBarItem_Neuromorphic: View {
    
    @ObservedObject var viewRouterNeuromorphic = ViewRouter()
    
    @State private var selection: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        CustomTabBarItem(iconName: "house", label: "Login")
                            
                            
                            .frame(width: geometry.size.width/6, height: 75)
                            .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "home" ? .black : .gray)
                            .onAppear {
                                self.viewRouterNeuromorphic.currentViewNeuromorphic = "home"
                        }
                        .onTapGesture {
                            self.viewRouterNeuromorphic.currentViewNeuromorphic = "home"
                        }
                        Spacer()
                        CustomTabBarItem(iconName: "book", label: "Catalogue")
                            .frame(width: geometry.size.width/7, height: 75)
                            .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "book" ? .black : .gray)
                            .onTapGesture {
                                self.viewRouterNeuromorphic.currentViewNeuromorphic = "book"
                        }
                        Spacer()
                        CustomTabBarItem(iconName: "antenna.radiowaves.left.and.right", label: "Connect")
                            .frame(width: geometry.size.width/6, height: 75)
                            .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "antenna" ? .black : .gray)
                            .onTapGesture {
                                self.viewRouterNeuromorphic.currentViewNeuromorphic = "antenna"
                        }
                        Spacer()
                        CustomTabBarItem(iconName: "gift", label: "News")
                            .frame(width: geometry.size.width/7, height: 75)
                            .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "gift" ? .black : .gray)
                            .onTapGesture {
                                self.viewRouterNeuromorphic.currentViewNeuromorphic = "gift"
                        }
                        Spacer()
                        CustomTabBarItem(iconName: "list.dash", label: "Magasine")
                            .frame(width: geometry.size.width/7, height: 75)
                            .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "list" ? .black : .gray)
                            .onTapGesture {
                                self.viewRouterNeuromorphic.currentViewNeuromorphic = "list"
                        }
                    }
                        .frame(width: geometry.size.width/6, height: 75)
                                                   .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "home" ? .black : .gray)
                    
                        
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
                        .background(Color.white)
                        
                        .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 8, x: 9, y: 9)
                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 8, x: -9, y: -9)
                }
                .edgesIgnoringSafeArea(.bottom)
                
            }
        }
    }
}

struct TabBar_Neuromorphic_Previews: PreviewProvider {
    static var previews: some View {
        
        TabBarItem_Neuromorphic()
    }
}


struct CustomTabBarItem: View {
    let iconName: String
    let label: String
    var onTap: () -> Void = {}
    
    var body: some View {
        
        VStack(alignment: .center) {
            Image(systemName: iconName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            
            .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 8, x: 9, y: 9)
            .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 8, x: -9, y: -9)
            
            .padding(10)
            
            Text(label)
                .font(.caption)
                
            
           
        }
    }
    
    private func test() {
        
    }
}


/*
 //                        ZStack {
 //                            Circle()
 //
 //                                .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "antenna" ? .black : .gray)
 //
 //
 //                                .frame(width: 60, height: 60)
 //                            Image(systemName: "antenna.radiowaves.left.and.right")
 //                                .resizable()
 //                                .aspectRatio(contentMode: .fit)
 //
 //                                .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 8, x: 9, y: 9)
 //                                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 8, x: -9, y: -9)
 //
 //                                .padding()
 //
 //                                .frame(width: 75, height: 75)
 //                                .foregroundColor(.white)
 */
