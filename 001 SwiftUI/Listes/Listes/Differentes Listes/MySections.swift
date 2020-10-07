//
//  MySections.swift
//  Listes
//
//  Created by Wandianga on 8/12/20.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import SwiftUI

struct MySections: View {
    
    var array1: [String]
    var array2: [Person]
    
    var body: some View {
        List{
            Section(header: Text("Les langages de programmation")) {
                
                ForEach(array1, id: \.self) { lang in
                    Text(lang)
                }
            }
            Section(header: Text("Les personnes"), footer: HStack{
                Spacer()
                Image(systemName: "paperplane.fill")
                Text("FIN")
                }
            ) {
                ForEach(array2, id: \.id) {
                    person in
                    
                    HStack {
                        Text(person.surname)
                        Text(person.name)
                        Spacer()
                        Text("\(person.age) ans")
                    }
                }
            }
        }
    }
}

struct MySections_Previews: PreviewProvider {
    static var previews: some View {
        MySections(array1: [], array2: [])
    }
}
