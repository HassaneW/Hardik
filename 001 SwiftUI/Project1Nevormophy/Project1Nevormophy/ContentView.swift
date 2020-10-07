//
//  ContentView.swift
//  Project1Nevormophy
//
//  Created by Bunti Nizama on 01/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import CollectionView

struct  User {
    let name : String
    let lastName : String
}

struct ContentView: View {
    
    let postList : [User] = [User(name: "name1", lastName: "last name") , User(name: "name1", lastName: "last name"),User(name: "name1", lastName: "last name"),User(name: "name1", lastName: "last name")]//[User(title: "Test1", body: "body"),Post(title: "Test1", body: "body"),Post(title: "Test1", body: "body"),Post(title: "Test1", body: "body")]
    var body: some View {
       
        CollectionView(postList, cell: {
            item in
            ZStack {
                Rectangle().background(Color.green)
                VStack{
                    HStack{
                        Text("NAme")
                        Text(item.name)
                    }
                    HStack{
                        Text("last name")
                        Text(item.lastName)
                    }
                }
            }
        }).itemSize(width: (UIScreen.main.bounds.width - 20) / 2, height: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
