//
//  ButtonBase.swift
//  La Navigation
//
//  Created by matthieu passerel on 03/10/2019.
//  Copyright © 2019 matthieu passerel. All rights reserved.
//

import SwiftUI

struct ButtonBase: View {
    
    var name: String
    var body: some View {
        HStack {
            Image(name)
            .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            Text(name.capitalized)
        }

    }
}

struct ButtonBase_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBase(name: "beeUI").previewLayout(.sizeThatFits)
    }
}
