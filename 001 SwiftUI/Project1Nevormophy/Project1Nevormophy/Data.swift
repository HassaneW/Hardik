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
            postData = try! JSONDecoder().decode([Post].self, from: data!)
            print(postData)
        }
    .resume()
    }
}
