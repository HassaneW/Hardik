//
//  DetailView.swift
//  001_Api_SwiftUI
//
//  Created by Bunti Nizama on 23/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var selectedData = DataModel()
    @Environment(\.managedObjectContext) var moc
    var isDisplayCodeData = false
    var eventData = EventData()

    var body: some View {
        ScrollView(){
            VStack(alignment: .leading,spacing: 10){
                
                DetailViewItem(title: "contact_name:", value: selectedData.contact_name)
                DetailViewItem(title: "address_street:", value: selectedData.address_street)
                DetailViewItem(title: "id:", value: selectedData.id)
                DetailViewItem(title: "date_end:", value: selectedData.date_end)
                 DetailViewItem(title: "category:", value: selectedData.date_end)
                 DetailViewItem(title: "date_start:", value: selectedData.date_start)
                 DetailViewItem(title: "address_name:", value: selectedData.address_name)
                 DetailViewItem(title: "contact_phone:", value: selectedData.contact_phone)
                 DetailViewItem(title: "description1:", value: selectedData.description1)
         
            }
            VStack(alignment: .leading,spacing: 10){
                DetailViewItem(title: "contact_twitter :",value : "\(selectedData.contact_twitter)")
                DetailViewItem(title: "contact_url :",value : "\(selectedData.contact_url)")
                DetailViewItem(title: "access_link :",value : "\(selectedData.access_link)")
                DetailViewItem(title: "tags :",value : "\(selectedData.tags)")
                DetailViewItem(title: "contact_mail :",value : "\(selectedData.contact_mail)")
                DetailViewItem(title: "contact_facebook :",value : "\(selectedData.contact_facebook)")
                DetailViewItem(title: "access_phone :",value : "\(selectedData.access_phone)")
                DetailViewItem(title: "address_city :",value : "\(selectedData.address_city)")
                DetailViewItem(title: "programs :",value : "\(selectedData.programs)")
                DetailViewItem(title: "transport :",value : "\(selectedData.transport)")
            }
            
              VStack(alignment: .leading,spacing: 10){
                DetailViewItem(title: "address_zipcode :",value : "\(selectedData.address_zipcode)")
                DetailViewItem(title: "date_description :",value : "\(selectedData.date_description)")
                }

        }
        .navigationBarItems(leading:
            Button(action: {
                
            }) {
                NavigationLink(destination: MapView1(selectedData: selectedData )) {
                    Text("Map")
                }
            },trailing:
            HStack{
            if isDisplayCodeData == true {
             Text("Delete").onTapGesture {
                 self.deleteData()
             }
            } else {
            Text("Add").onTapGesture {
                self.addDataToCoreData()
            }
                }
            }
        )
        .navigationBarTitle(selectedData.title)
    }
    
    func deleteData(){
        print("delete Data")
        self.moc.delete(eventData)
    }
    
    func addDataToCoreData(){
        let newEvent = EventData(context: self.moc)
        let data = selectedData
        newEvent.contact_name = selectedData.contact_name
        newEvent.address_street = data.address_street
        newEvent.id = data.id
        newEvent.date_end = data.date_end
        newEvent.category = data.category
        newEvent.title = data.title
        newEvent.date_start = data.date_start
        newEvent.address_name = data.address_name
        newEvent.contact_phone = data.contact_phone
        newEvent.description1 = data.description1
        newEvent.contact_twitter = data.contact_twitter
        newEvent.contact_url = data.contact_url
        newEvent.access_link = data.access_link
        newEvent.tags = data.tags
        newEvent.contact_mail = data.contact_mail
        newEvent.contact_facebook = data.contact_facebook
        newEvent.access_phone = data.access_phone
        newEvent.address_city = data.address_city
        newEvent.programs = data.programs
        newEvent.transport = data.transport
        newEvent.address_zipcode = data.address_zipcode
        newEvent.date_description = data.date_description
        newEvent.lattitude = data.lattitude
        newEvent.longitude = data.longitude
//
        try? self.moc.save()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct DetailViewItem:View {
    var title : String
    var value : String
    var body: some View{
        HStack(alignment: .firstTextBaseline){
            Text(title).foregroundColor(.black).multilineTextAlignment(.leading)
                           Text(value).foregroundColor(.gray).multilineTextAlignment(.leading)
        }
    }
}
