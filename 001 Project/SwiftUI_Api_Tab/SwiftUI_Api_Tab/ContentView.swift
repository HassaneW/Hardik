//
//  ContentView.swift
//  SwiftUI_Api_Tab
//
//  Created by Bunti Nizama on 03/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    @State var departments : [Department] = [Department(departmentID: 0, displayName: "test")]

    var body: some View {
          
        List(departments) { data in
                       HStack{
                        ListRow(department: data)
                       }
               }
        .onAppear(){
            self.apiCall()
        }
               .navigationBarTitle(Text("Landmarks"))
           
       }
    func apiCall() {
            let url:String =  "https://collectionapi.metmuseum.org/public/collection/v1/departments"
          
           AF.request(url).response { response in
               print(response)
               
               switch response.result {
               case .success(let value):
                   let json = JSON(value!)
                   print(json)
                   let model = try? JSONDecoder().decode(ModelMet.self, from: value!)
                   if model != nil {
                    self.departments = model!.departments
                   }
                
                   break
               case .failure(let error):
                   print(error)
                   break
               }
           }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
         ContentView()
    }
}

struct ListRow: View {
    var department: Department

    var body: some View {
        HStack {
            Image(uiImage:  UIImage(systemName: "house.fill")!)
                .resizable()
                .frame(width: 50, height: 50)
                .border( Color.black, width: 1)
                .padding(10)
            Text(department.displayName)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRow(department: Department(departmentID: 0, displayName: "test"))
//            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
