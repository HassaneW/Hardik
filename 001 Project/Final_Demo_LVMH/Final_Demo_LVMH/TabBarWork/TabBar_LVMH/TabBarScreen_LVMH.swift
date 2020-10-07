//
//  TabBar_LVMH.swift
//  Final_Demo_LVMH
//
//  Created by Wandianga on 9/3/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct TabBar_LVMH: View {
    
    @ObservedObject var viewRouterNeuromorphic = ViewRouter()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .lastTextBaseline) {
                CustomTabBarItem(iconName: "house", label: "Login")
                    .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "home" ? .black : .gray)
                    .onAppear {
                        self.viewRouterNeuromorphic.currentViewNeuromorphic = "home"
                }
                .onTapGesture {
                    self.viewRouterNeuromorphic.currentViewNeuromorphic = "home"
                }
                Spacer()
                CustomTabBarItem(iconName: "book", label: "Catalogue")
                    .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "book" ? .black : .gray)
                    .onTapGesture {
                        self.viewRouterNeuromorphic.currentViewNeuromorphic = "book"
                }
                Spacer()
                CustomTabBarItem(iconName: "gift", label: "News")
                    .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "News" ? .black : .gray)
                    .onTapGesture {
                        self.viewRouterNeuromorphic.currentViewNeuromorphic = "News"
                }
                Spacer()
                CustomTabBarItem(iconName: "antenna.radiowaves.left.and.right", label: "Connect")
                    .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "Connect" ? .black : .gray)
                    .onTapGesture {
                        self.viewRouterNeuromorphic.currentViewNeuromorphic = "Connect"
                }
                Spacer()
                CustomTabBarItem(iconName: "list.dash", label: "Magasine")
                    .foregroundColor(self.viewRouterNeuromorphic.currentViewNeuromorphic == "list" ? .black : .gray)
                    .onTapGesture {
                        self.viewRouterNeuromorphic.currentViewNeuromorphic = "list"
                }
            }
            .background(
                GeometryReader { parentGeometry in
                    Rectangle()
                        .fill(Color(UIColor.systemGray2))
                        .frame(width: parentGeometry.size.width, height: 0.5)
                        .position(x: parentGeometry.size.width / 2, y: 0)
                        .background(Color.white)
                        .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 8, x: 9, y: 9)
                        .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 8, x: -9, y: -9)
                }
            )
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct TabBar_LVMH_Previews: PreviewProvider {
    static var previews: some View {
        TabBar_LVMH()
    }
}

struct CustomTabBarItem: View {
    let iconName: String
    let label: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: iconName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 8, x: 9, y: 9)
            .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 8, x: -9, y: -9)
            .padding()
            Text(label)
                .font(.caption)
        }
    }
}
