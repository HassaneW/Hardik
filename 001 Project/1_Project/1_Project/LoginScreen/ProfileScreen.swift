//
//  ProfileScreen.swift
//  1_Project
//
//  Created by Bunti Nizama on 24/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import CoreData

struct ProfileScreen: View {
     
//    @FetchRequest(fetchRequest: ImageBook.allToDoFetchRequest()) var toDos: FetchedResults<ImageBook>
    @Environment(\.managedObjectContext) var managedObjectContext
     
     // The ToDo class has an `allToDoFetchRequest` function that can be used here
    @FetchRequest(entity: ImageBook.entity(), sortDescriptors: []) var books: FetchedResults<ImageBook>
    @State private var willMoveToNextScreen = false

    var body: some View {
        //        Text("Hello, World!")
            ZStack{
                Color("Color").edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    //Logo
//                    VStack(spacing: 0) {
                    
                    Text("Count: \(books.count)")
                    
                        Image("logo")
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 5))
                        .padding(.bottom, 50)
                       

                    
                    Text("First Name : LOUIS").padding(10)
                    Text("Last Name : VUITTON").padding(10)
                    Text("BirthDay : 1876").padding(10)
                    Text("Address : 10 rue de la mod").padding(10)
                    
                    List {
                                   ForEach(books, id: \.id) { student in
                                    TaskRow(todo: student)
                                   }.onDelete { (indexSet) in
                                       let toDoDelete = self.books[indexSet.first!]
                                       self.managedObjectContext.delete(toDoDelete)
                                       try! self.managedObjectContext.save()
                                   }
                               }
                    
                    
//                    ForEach(books) { book in
//                        TaskRow(todo: book)
//                    } .onDelete { (indexSet) in
//                        let toDoDelete = self.toDos[indexSet.first!]
//                        self.managedObjectContext.delete(toDoDelete)
//                        try! self.managedObjectContext.save()
//                    }
                }
                 .frame(maxHeight:.infinity,  alignment: .top)
                
                .navigationBarItems(trailing:
                    NavigationLink(destination: CardScreen() ) {
                                               Text("Payment")
                                              }                    
                           )
            }
                
               
            .navigationBarTitle("Profile " , displayMode: .inline)
//            .padding(.horizontal,20)
        
    }
    
    func imageFromString(_ imageData : String) -> UIImage {
        let dataDecoded: Data  = Data(base64Encoded: imageData, options: NSData.Base64DecodingOptions(rawValue: 0))!
        let decodedimage:UIImage = UIImage(data: dataDecoded as Data)!
        
        return decodedimage
    }
    
}


struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}


struct TaskRow: View {
    @State var todo: ImageBook
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
           
            NavigationLink(destination: ListDetail(person: Person(name: todo.title!, image: self.convertBase64ToImage(string: todo.image!))) ) {
                               HStack{
                                  ListRow(person: Person(name: todo.title!, image: self.convertBase64ToImage(string: todo.image!)))
                               }
                           }
           
        } .padding()
    }
    
    
    func convertBase64ToImage(string : String) -> UIImage {
           let imageData = Data(base64Encoded: string, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
                   
        return  UIImage(data: imageData)!
       }
}
