//
//  PresentationButton.swift
//  La Navigation
//
//  Created by matthieu passerel on 03/10/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import SwiftUI

struct PresentationButton: View {
    
    @Binding var show: Bool
    @Binding var selected: String
    var name: String
    
    var body: some View {
        Button(action: {
            self.show.toggle()
            self.selected = self.name
        }) {
            ButtonBase(name: self.name)
        }
    }
}

struct PresentationButton_Previews: PreviewProvider {
    static var previews: some View {
        PresentationButton(show: .constant(false), selected: .constant("swiftUI"), name: "swiftUI").previewLayout(.sizeThatFits)
    }
}
