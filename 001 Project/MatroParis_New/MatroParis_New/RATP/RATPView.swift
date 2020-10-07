//
//  RATPView.swift
//  MatroParis_New
//
//  Created by Bunti Nizama on 07/10/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import SwiftUI
import Alamofire

struct RATPView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var records = [Records]()
    @State var start = 1
    var body: some View {
            NavigationView {
                VStack{
                    if records.count == 0 {
                        Text("No Data")
                    } else {
    //                    ScrollView{
                        VStack {
                         
                                List(records.indices,id: \.self) { index in
                                    HStack{
                                        NavigationLink(destination: DetailView(record: self.records[index], isFrom: .ratp).environment(\.managedObjectContext, self.managedObjectContext) ) {
                                            RATPListRow(data: self.records[index], index: index).onAppear(){
                                                if index == self.records.count-1 {
                                                    self.start = self.start + 1
                                                    self.apiCall()
                                                }
                                            }
                                        }
                                    }
                                }
                        
    //                    }
                        }
                    }
                }
                .onAppear(){
                    self.apiCall()
                }
                .navigationBarTitle("RATP List")
            }
        }
    
    func apiCall() {
           let url =  "https://dataratp2.opendatasoft.com/api/records/1.0/search/?dataset=accessibilite-des-gares-et-stations-metro-et-rer-ratp&q=&facet=ufr&facet=paqt&rows=20&start=\(start)"
          
           AF.request(url)
           .validate()
               .responseDecodable(of: APIResponseModel.self) { (response) in
                   guard let data = response.value else { return }
                   if data.records != nil {
                       if self.start == 1 {
                           self.records.removeAll()
                           self.records = data.records!
                       } else {
                           self.records.append(contentsOf: data.records!)
                       }
                       print("start :\(self.start) TotalCount :\(self.records.count)")
                   }
           }
       }
}

struct RATPView_Previews: PreviewProvider {
    static var previews: some View {
        RATPView()
    }
}


struct RATPListRow: View {
var data: Records
    var index : Int
var body: some View {
    HStack {
        VStack{
            Text("\(index):\(data.fields!.nomptar!)")
        }
        Spacer()
    }
}
}
