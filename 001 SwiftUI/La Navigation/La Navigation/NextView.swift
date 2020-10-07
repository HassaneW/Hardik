//
//  NextView.swift
//  La Navigation
//
//  Created by matthieu passerel on 03/10/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import SwiftUI

struct NextView: View {
    
    var text: String
    @Environment(\.presentationMode) var pres
    
    var body: some View {
        VStack {
            if pres.wrappedValue.isPresented {
                HStack {
                    Spacer()
                    Button(action: {
                        self.pres.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }.padding()
            }
            Spacer()
            Image(text)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300, alignment: .center)
            Text(text)
                .foregroundColor(.red)
                .font(.largeTitle)
            Spacer()
        }
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView(text: "beeUI")
    }
}
