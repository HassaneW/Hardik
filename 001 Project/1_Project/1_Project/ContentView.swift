//
//  ContentView.swift
//  1_Project
//
//  Created by Bunti Nizama on 10/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
//             LaunchScreen()
       // LaunchScreen(image: Image("logo")).environment(\.managedObjectContext, managedObjectContext)
        
        Animation_Lancement_V4().environment(\.managedObjectContext, managedObjectContext)
//        TabBarScreen().environment(\.managedObjectContext, managedObjectContext)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//struct ProgressBar: View {
//    @Binding var progress: Float
//    @State var scale: CGFloat = 1
//    var body: some View {
//        ZStack {
//            Circle()
//                .stroke(lineWidth: 10.0)
//                .opacity(0.3)
//                .foregroundColor(Color.black)
//
//            Circle()
//                .trim(from: 0.0, to: CGFloat(progress))
//                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
//                .foregroundColor(Color.black)
//        }
//    }
//}
