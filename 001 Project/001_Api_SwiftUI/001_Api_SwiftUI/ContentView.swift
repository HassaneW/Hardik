//
//  ContentView.swift
//  001_Api_SwiftUI
//
//  Created by Bunti Nizama on 22/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ContentView: View {
    @State var dataArray = [DataModel]()
    @Environment(\.managedObjectContext) var moc
      
      @FetchRequest(entity: EventData.entity(), sortDescriptors: []) var events: FetchedResults<EventData>
    var isDisplayCodeData = false
    var body: some View {
        VStack{
        if isDisplayCodeData == true {
//            Text("Events Count : \(events.count)")
//            ForEach(
                List(events,id: \.self) { selectedData in
                    NavigationLink(destination: DetailView(selectedData: self.getDataModel(data: selectedData) , isDisplayCodeData :self.isDisplayCodeData , eventData: selectedData ).environment(\.managedObjectContext, self.moc) ) {
                    HStack{
                        ListRow(data: self.getDataModel(data: selectedData))
                    }
                }
            }
            
        } else {
            List(dataArray) { selectedData in
                           NavigationLink(destination: DetailView(selectedData: selectedData).environment(\.managedObjectContext, self.moc) ) {
                               HStack{
                                   ListRow(data: selectedData)
                               }
                           }
                       }
           
        }
        }
        .navigationBarItems(trailing:
                           Button(action: {
                               self.apiCall()
                           }) {
                               Text("Refresh")
                           }
                       )
                   .navigationBarTitle("Home")
//            .onAppear(){
//                self.apiCall()
//            }
                
        
    }

     func apiCall() {
        if isDisplayCodeData {
            
            
            return
        }
        let url:String =  "https://opendata.paris.fr/api/records/1.0/search/?dataset=que-faire-a-paris-&q=que-faire-a-paris-&facet=category&facet=tags&facet=address_zipcode&facet=address_city&facet=pmr&facet=blind&facet=deaf"
        
         AF.request(url).response { response in
             print(response)
             
             switch response.result {
             case .success(let value):
                 let json = JSON(value!)
                 print(json)
                 let jsonString = "\(json["records"].arrayValue)"
                 let jsonData = DataModel.stringToJsonObject(stringData: jsonString)
                 self.dataArray = DataModel.parseData(dataArray1: jsonData)
              
                 break
             case .failure(let error):
                 print(error)
                 break
             }
         }
    }
    
    
    func getDataModel(data : EventData) -> DataModel{
                let newEvent = DataModel()
        newEvent.contact_name = data.contact_name!
                newEvent.address_street = data.address_street!
                newEvent.id = data.id!
                newEvent.date_end = data.date_end!
                newEvent.category = data.category!
                newEvent.title = data.title!
                newEvent.date_start = data.date_start!
                newEvent.address_name = data.address_name!
                newEvent.contact_phone = data.contact_phone!
                newEvent.description1 = data.description1!
                newEvent.contact_twitter = data.contact_twitter!
                newEvent.contact_url = data.contact_url!
                newEvent.access_link = data.access_link!
                newEvent.tags = data.tags!
                newEvent.contact_mail = data.contact_mail!
                newEvent.contact_facebook = data.contact_facebook!
                newEvent.access_phone = data.access_phone!
                newEvent.address_city = data.address_city!
                newEvent.programs = data.programs!
                newEvent.transport = data.transport!
                newEvent.address_zipcode = data.address_zipcode!
                newEvent.date_description = data.date_description!
                newEvent.lattitude = data.lattitude
                newEvent.longitude = data.longitude
         return newEvent
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListRow: View {
var data: DataModel
var body: some View {
    HStack {
        Text(data.title)
        Spacer()
    }
}

}


