//
//  NewTabScreen.swift
//  1_Project
//
//  Created by Bunti Nizama on 19/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import SwiftUICardStack

struct NewTabScreen: View {
    @State private var selectorIndex = 0
    @State private var numbers = ["Art de Vivre","Cadrans","Male","Woman"]
    @State private var imagePersonArray =  [[
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
    ]]
    

    var body: some View {
        NavigationView{
            
            VStack(alignment: .center) {
                // 2
                Picker("", selection: $selectorIndex) {
                    ForEach(0 ..< numbers.count) { index in
                        Text(self.numbers[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Basic(data: imagePersonArray ,selectorIndex: $selectorIndex).frame(maxHeight:.infinity, alignment: .center)
            }
            .frame(maxHeight:.infinity,  alignment: .top)
            .background(Color("Color"))
                
            .navigationBarTitle("New" , displayMode: .inline)
            .navigationBarColor(UIColor.backgourfOfApplication)
        }
        .background(Color("Color"))
    }
}



struct NewTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewTabScreen()
    }
}

struct CardView: View {
    let person: Person
   
    var body : some View {
        GeometryReader { geo in
            VStack {
                Image(uiImage: self.person.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: geo.size.width)
                    .clipped()
                HStack{
                    Text(self.person.name)
                   
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 4)
            
        }
    }
}

struct Basic: View {
    @State var data: [[Person]] = [Person.mock]
    @Binding var selectorIndex:Int
    var body: some View {
        CardStack(
            direction: LeftRight.direction,
            data: data[selectorIndex],
            onSwipe: { card, direction in
                print("Swiped \(card.name) to \(direction)")
        },
            content: { person, _, _ in
                CardView(person: person)
        }
        )
            .padding()
            .scaledToFit()
            .frame(alignment: .center)
           
    }
}


struct Person: Identifiable {
    var id = UUID()
    var name : String
    var image : UIImage
   
    static let mock: [Person] = [
        Person(name: "Miller", image: UIImage(named: "Art1" )!),
        Person(name: "Smart", image: UIImage(named: "Art2" )!),
        Person(name: "Bain", image: UIImage(named: "Art3" )!),
        Person(name: "velez", image: UIImage(named: "Art4" )!),
    ]
    
    
    init( name: String , image : UIImage) {

        self.name = name
        self.image = image
    }
}
