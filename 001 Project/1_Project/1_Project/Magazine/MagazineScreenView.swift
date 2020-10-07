//
//  MagazineScreenView.swift
//  1_Project
//
//  Created by Bunti Nizama on 21/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
enum RadioOptions: String {
    case Actualités = "Actualités"
    case Mode = "Mode"
    case Celebrites = "Celebrites"
    case Voyage = "Voyage"
    case Artetculture = "Art et culture"
    case LaMaison = "La maison"
}

struct MagazineScreenView: View {
    @State var selectedOption = ""
    @State var selectedIndex = 0
    var body: some View {
        NavigationView{
            VStack {
                Text("Select Option")
                    .font(Font.headline)
                RadioButtonGroups { selected in
                    self.selectedOption = selected
                    switch selected{
                    case RadioOptions.Actualités.rawValue :
                        self.selectedIndex = 0
                    case RadioOptions.Mode.rawValue :
                        self.selectedIndex = 1
                    case RadioOptions.Celebrites.rawValue :
                        self.selectedIndex = 2
                    case RadioOptions.Voyage.rawValue :
                        self.selectedIndex = 3
                    case RadioOptions.Artetculture.rawValue :
                        self.selectedIndex = 4
                        
                    default:
                        self.selectedIndex = 4
                    }
                }
    
                if self.selectedOption.count != 0 {
                    NavigationLink(destination: ListData(selectorIndex: selectedIndex)) {
                        HStack{
                            Text("Validate")
                        }
                    }
                }
            }.padding()
                .background(Color("Color"))
                .navigationBarTitle("Magazine")
                .navigationBarColor(UIColor.backgourfOfApplication)
        }
        .background(Color("Color"))
    }
}

struct MagazineScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MagazineScreenView()
    }
}


struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View {
        VStack {
            radioActualitésMajority
            radioMode
            radioCelebrites
            radioVoyage
            radioArtetculture
        }
    }
    
    var radioActualitésMajority: some View {
        RadioButtonField(
            id: RadioOptions.Actualités.rawValue,
            label: RadioOptions.Actualités.rawValue,
            isMarked: selectedId == RadioOptions.Actualités.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioMode: some View {
        RadioButtonField(
            id: RadioOptions.Mode.rawValue,
            label: RadioOptions.Mode.rawValue,
            isMarked: selectedId == RadioOptions.Mode.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioCelebrites: some View {
        RadioButtonField(
            id: RadioOptions.Celebrites.rawValue,
            label: RadioOptions.Celebrites.rawValue,
            isMarked: selectedId == RadioOptions.Celebrites.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioVoyage: some View {
        RadioButtonField(
            id: RadioOptions.Voyage.rawValue,
            label: RadioOptions.Voyage.rawValue,
            isMarked: selectedId == RadioOptions.Voyage.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioArtetculture: some View {
        RadioButtonField(
            id: RadioOptions.Artetculture.rawValue,
            label: RadioOptions.Artetculture.rawValue,
            isMarked: selectedId == RadioOptions.Artetculture.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioLaMaison: some View {
           RadioButtonField(
               id: RadioOptions.LaMaison.rawValue,
               label: RadioOptions.LaMaison.rawValue,
               isMarked: selectedId == RadioOptions.LaMaison.rawValue ? true : false,
               callback: radioGroupCallback
           )
       }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}
