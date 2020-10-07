//
//  ObservedObjectView.swift
//  DataFlow
//
//  Created by Bunti Nizama on 15/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI



struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView()
    }
}

class dataModel: ObservableObject {
    @Published var message = "Hello, World! : False"
}

struct ObservedObjectView: View {
    @ObservedObject var data = dataModel()
    @State var isDisplay : Bool = false
    var body: some View {
        VStack {
            Text(data.message)
      
            Button(action: {
                self.isDisplay.toggle()
                if self.isDisplay == false {
                    self.data.message = "Hello, World! : false"
                } else {
                    self.data.message = "Hello, World! : True"
                }
            }) {
                 Text("Change Display")
             }
        
    }
}
}



