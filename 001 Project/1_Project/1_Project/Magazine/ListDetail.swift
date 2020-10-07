//
//  ListDetail.swift
//  1_Project
//
//  Created by Bunti Nizama on 24/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import CoreData

struct ListDetail: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
     var person: Person
    var description : String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    var body: some View {
        ScrollView()
        {
            ZStack(alignment: .top) {
                // << made explicit alignment to top
                
                VStack(spacing: 0) {
                   
                    VStack(spacing: 10){
                        Spacer()
                                 
                                  Text(person.name)
                                      .fontWeight(.heavy)
                                      .font(.system(size: 40))
                                  Image(uiImage:person.image )
                                 .resizable()
                                 .aspectRatio(contentMode: .fit)
                                  .frame(width: 200, height: 200, alignment: .center)
                      
                      
                      
                                  Text(description).padding(10)
                      
                                  
                    }
                    .background(Color("Color"))
                    
                    
                }
                .foregroundColor(Color.black.opacity(0.7))
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                .offset(x: 0, y: 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Color("Color"))
//              .navigationBarTitle("" , displayMode: .inline)
            .navigationBarItems(trailing:
                 HStack {
                    NavigationLink(destination: ProfileScreen() ) {
                                                                            Text("Profile")
                                                                            .foregroundColor(Color.black.opacity(0.7))
                                                                            .padding(.vertical)
                                                                            .frame(width: UIScreen.main.bounds.width - 120)
                                                            
                                                                        }
                Button("Add") {
                    self.addDataOnDataBase()
                }
                }
            )
                .navigationBarColor(UIColor.backgourfOfApplication)
            //        .edgesIgnoringSafeArea(.bottom)
            
        }
        .background(Color("Color"))
    }
    
    
    func addDataOnDataBase(){
        let imageData = ImageBook(context: self.moc)
        imageData.id = UUID()
        imageData.image = self.convertImageToBase64(person.image)
        imageData.title = person.name
        imageData.descriptionOfImage = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        //
        try? self.moc.save()
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func convertImageToBase64(_ image: UIImage) -> String {
        let imageData: NSData = image.jpegData(compressionQuality: 0.7)! as NSData
       let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)

       return strBase64
    }
    
     
}



struct ListDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListDetail(person: Person(name: "Miller", image: UIImage(named: "Art1" )!), description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
    }
}
