//
//  Data.swift
//  Project1Nevormophy
//
//  Created by Bunti Nizama on 01/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct Post:Codable , Identifiable {
    let id = UUID()
    var title:String
    var body : String
}
var postData = [Post]()
class Api {
    func getPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { (data,_,_) in
            
            print(postData)
            DispatchQueue.main.async {
                postData = try! JSONDecoder().decode([Post].self, from: data!)
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate
            else {
              return
            }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    // your code here
                    sceneDelegate.contentView = ContentView()
                    sceneDelegate.window?.rootViewController = UIHostingController(rootView: sceneDelegate.contentView)
                }
           
            }
        }
    .resume()
    }
}
