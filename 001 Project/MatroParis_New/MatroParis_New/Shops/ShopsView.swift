//
//  ShopsView.swift
//  MatroParis_New
//
//  Created by Bunti Nizama on 07/10/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import SwiftUI
import Alamofire
//import SwiftyJSON
import MapKit
import CoreLocation

struct ShopsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
       @State var records  = [Records]()
       @State var start = 1
       @State var checkPoints  = [Checkpoint]()
       @State var isDisplayMap = false
    var body: some View {
        NavigationView {
            VStack{
                if records.count == 0 {
                    Text("No Data")
                } else {
                    VStack {
                        if isDisplayMap == false {
                            List(records.indices,id: \.self) { index in
                                HStack{
                                    NavigationLink(destination: DetailView(record: self.records[index] , isFrom: .shops).environment(\.managedObjectContext, self.managedObjectContext) ) {
                                        ListRow(data: self.records[index], index: index).onAppear(){
                                            if index == self.records.count-1 {
                                                self.start = self.start + 1
                                                self.apiCall()
                                            }
                                        }
                                    }
                                }
                            }
                    }
                        else {
                            if records.count > 0 {
                                MapView(checkpoint: checkPoints, location: CLLocationCoordinate2D(latitude: records[0].fields!.coord_geo![0], longitude: records[0].fields!.coord_geo![1]))
                            }
                        }
                    }
                }
            }
            .onAppear(){
                self.apiCall()
            }
                .navigationBarItems(trailing:

                    Text(isDisplayMap ? "List" : "Map").onTapGesture {
                        self.isDisplayMap.toggle()
                    }

                       )
            .navigationBarTitle("Shop List")
        }
    }
    
    func apiCall() {
          let url =  "https://dataratp2.opendatasoft.com/api/records/1.0/search/?dataset=liste-des-commerces-de-proximite-agrees-ratp&q=&facet=jour_fermeture&rows=100&start=\(start)"
         
          AF.request(url)
          .validate()
              .responseDecodable(of: APIResponseModel.self) { (response) in
                  guard let data = response.value else { return }
                  if data.records != nil {
                      if self.start == 1 {
                          self.records.removeAll()
                          self.records = data.records!
                          self.checkPoints.removeAll()
                      } else {
                          self.records.append(contentsOf: data.records!)
                      }
                      self.addCheckpoints(array: data.records!)
                      print("start :\(self.start) TotalCount :\(self.records.count)")
                  }
          }
      }
      
      func addCheckpoints(array : [Records]) {
          var checkpointArray = [Checkpoint]()
          for record in array {
              var shopLocation = CLLocation(latitude: record.fields!.coord_geo![0], longitude: record.fields!.coord_geo![1])
              var currentLocation = CLLocation(latitude: records[0].fields!.coord_geo![0], longitude: records[0].fields!.coord_geo![1])
              var distanceInMeters = shopLocation.distance(from: currentLocation)//[shopLocation distanceFromLocation:currentLocation];
              if distanceInMeters <= 2500 {
                  var checkpoint =  Checkpoint(title:record.fields!.nom_commerce! , coordinate: CLLocationCoordinate2D(latitude: record.fields!.coord_geo![0], longitude: record.fields!.coord_geo![1]))
                  checkpointArray.append(checkpoint)
              }
          }

          checkPoints.append(contentsOf: checkpointArray)
      }
}

struct ShopsView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsView()
    }
}


struct ListRow: View {
var data: Records
    var index : Int
var body: some View {
    HStack {
        VStack{
            Text("\(index):\(data.fields!.nom_commerce!)")
            Text("\(data.fields!.adresse_livraison!) \(data.fields!.code_postal_livraison!)")
        }
        Spacer()
    }
}
}
