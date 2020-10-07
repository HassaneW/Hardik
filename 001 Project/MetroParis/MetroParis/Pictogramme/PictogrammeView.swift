//
//  PictogrammeView.swift
//  MetroParis
//
//  Created by Bunti Nizama on 05/10/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import Alamofire
//import SwiftyJSON
import MapKit
import CoreLocation
import SVGKit

struct PictogrammeView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
      @State var records  = [Records]()
      @State var start = 1
     let column:Int = 2
     var body: some View {
           NavigationView {
               VStack{
                   if records.count == 0 {
                       Text("No Data")
                   } else {
                    ScrollView(){
                       VStack {
                        
                        ForEach(0..<(records.count / column)) { i in
                                               HStack{
                                                   ForEach(0..<self.column) { j in
                                                       CollectionViewCell1(selectedData: self.records[j+(i*self.column)]).environment(\.managedObjectContext, self.managedObjectContext)
                                                   }
                                               }
                                           }
                       }
                   }
                }
               }
               .onAppear(){
                   self.apiCall()
               }
                  
               .navigationBarTitle("Pictogramme List")
        }
       }
    
    func apiCall() {
           let url =  "https://dataratp2.opendatasoft.com/api/records/1.0/search/?dataset=pictogrammes-des-lignes-de-metro-rer-tramway-bus-et-noctilien&q=&facet=jour_fermeture&rows=20&start=\(start)"
          
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

struct PictogrammeView_Previews: PreviewProvider {
    static var previews: some View {
        PictogrammeView()
    }
}

struct  CollectionViewCell1 : View {
    var selectedData = Records()
    let width = (UIScreen.main.bounds.width / 2) - 20
    var title = "1"
    @Environment(\.managedObjectContext) var moc
     var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).frame(width: width, height: width).foregroundColor(.green)
            NavigationLink(destination: DetailView(record: selectedData , isFrom : .pictogramme).environment(\.managedObjectContext, self.moc)) {
            Text("\(selectedData.fields!.indices_commerciaux!)").padding(20).foregroundColor(.black).frame(width: width, height: width)
            }
        }
    }
    
}


//1da0d7fb9926b58f8e399ac21b98f8a9
//https://dataratp2.opendatasoft.com/explore/dataset/pictogrammes-des-lignes-de-metro-rer-tramway-bus-et-noctilien/files/1da0d7fb9926b58f8e399ac21b98f8a9/300/
//https://dataratp2.opendatasoft.com/explore/dataset/pictogrammes-des-lignes-de-metro-rer-tramway-bus-et-noctilien/download/?format=csv&timezone=Asia/Kolkata&lang=fr&use_labels_for_header=true&csv_separator=%3B
//21genrvb.svg
//https://data.opendatasoft.com/page/home/
//https://data.opendatasoft.com/api/v2/console#!/export_catalog/exportDatasetsCSV
///https://dataratp2.opendatasoft.com/api/records/1.0/download?dataset=pictogrammes-des-lignes-de-metro-rer-tramway-bus-et-noctilien@dataratp


// pass datasetid and id
//https://dataratp2.opendatasoft.com/api/v2/catalog/datasets/pictogrammes-des-lignes-de-metro-rer-tramway-bus-et-noctilien/files/eb0103018588be8973a997ede1f6ad8e
