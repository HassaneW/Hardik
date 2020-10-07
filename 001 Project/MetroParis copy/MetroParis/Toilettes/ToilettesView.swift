//
//  ToilettesView.swift
//  MetroParis
//
//  Created by Bunti Nizama on 06/10/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import Alamofire
//import SwiftyJSON
import MapKit
import CoreLocation

struct ToilettesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var records  = [Records]()
    @State var start = 1
    var body: some View {
            NavigationView {
                VStack{
                    if records.count == 0 {
                        Text("No Data")
                    } else {
                        VStack {
                                List(records.indices,id: \.self) { index in
                                    HStack{
                                        NavigationLink(destination: DetailView(record: self.records[index], isFrom: .toilettes).environment(\.managedObjectContext, self.managedObjectContext) ) {
                                            ToilettesListRow(data: self.records[index], index: index).onAppear(){
                                                if index == self.records.count-1 {
                                                    self.start = self.start + 1
                                                    self.apiCall()
                                                }
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
                .navigationBarTitle("Toilettes List")
            }
        }
    
    func apiCall() {
          let url =  "https://data.ratp.fr/api/records/1.0/search/?dataset=sanitaires-reseau-ratp&q=&facet=ligne&facet=station&facet=tarif_gratuit_payant&facet=acces_bouton_poussoir&facet=en_zone_controlee&facet=hors_zone_controlee_station&facet=hors_zone_controlee_voie_publique&rows=20&start=\(start)"
        
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

struct ToilettesView_Previews: PreviewProvider {
    static var previews: some View {
        ToilettesView()
    }
}

struct ToilettesListRow: View {
    var data: Records
    var index : Int
    var body: some View {
        HStack {
            VStack{
                Text("\(index):\(data.fields!.gestionnaire!)")
            }
            Spacer()
        }
    }
}
