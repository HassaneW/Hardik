//
//  ListData.swift
//  1_Project
//
//  Created by Bunti Nizama on 21/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//
import SwiftUI

struct ListData: View {
  
   var selectorIndex:Int = 0
    var imagePersonArray =  [[
           Person(name: "Miller", image: UIImage(named: "Art1" )!),
           Person(name: "Smart", image: UIImage(named: "Art2" )!),
           Person(name: "Bain", image: UIImage(named: "Art3" )!),
           Person(name: "velez", image: UIImage(named: "Art4" )!),
       ] ,
       [
           Person(name: "ca", image: UIImage(named: "Cad1" )!),
           Person(name: "ca", image: UIImage(named: "Cad2" )!),
           Person(name: "ca", image: UIImage(named: "Cad3" )!),
           Person(name: "ca", image: UIImage(named: "Cad4" )!),
       ],
       [
           Person(name: "we", image: UIImage(named: "male1" )!),
           Person(name: "we", image: UIImage(named: "male2" )!),
           Person(name: "we", image: UIImage(named: "male3" )!),
           Person(name: "we", image: UIImage(named: "male4" )!),
       ],
       [
           Person(name: "df", image: UIImage(named: "female1" )!),
           Person(name: "df", image: UIImage(named: "female2" )!),
           Person(name: "df", image: UIImage(named: "female3" )!),
           Person(name: "df", image: UIImage(named: "female4" )!),
       ],
    [
        Person(name: "Miller", image: UIImage(named: "Art1" )!),
        Person(name: "Smart", image: UIImage(named: "Art2" )!),
        Person(name: "Bain", image: UIImage(named: "Art3" )!),
        Person(name: "velez", image: UIImage(named: "Art4" )!),
    ] ]
    
    var body: some View {
       
            List(imagePersonArray[selectorIndex]) { selectedPerson in
                NavigationLink(destination: ListDetail(person: selectedPerson) ) {
                    HStack{
                       ListRow(person: selectedPerson)
                    }
                }                    
            }
            .navigationBarTitle(Text("Landmarks"))
        
    }
}

struct ListData_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            ListData()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
