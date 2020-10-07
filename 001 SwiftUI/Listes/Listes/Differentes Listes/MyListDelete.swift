//
//  MyListDelete.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MyListDelete: View {
    
  @Binding var langArray: [String]
    
    
    var body: some View {
        List{
            ForEach(langArray, id: \.self) { a in
                NavigationLink(destination: DetailView(string: a)) {
                    HStack{
                            Spacer()
                            
                            Text(a)
                                .foregroundColor(.white)
                                .font(.title)
                            Spacer()
                        }
                        .background(Color.red)
                        .cornerRadius(25)
                        .padding()
                    }
                }
                
            .onDelete { (indexSet) in
                if let index = indexSet.first {
                    self.langArray.remove(at: index)
                }
            }
            .onMove { (indexset, destination) in
                self.langArray.move(fromOffsets: indexset, toOffset: destination)
            }
        }
    }
}

struct MyListDelete_Previews: PreviewProvider {
    static var previews: some View {
        MyListDelete(langArray: .constant([]))
    }
}
