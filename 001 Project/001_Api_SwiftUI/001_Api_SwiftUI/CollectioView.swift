//
//  ListView.swift
//  001_Api_SwiftUI
//
//  Created by Bunti Nizama on 23/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON
struct CollectioView: View {
    @State var dataArray = [DataModel]()
    let column:Int = 2
     @Environment(\.managedObjectContext) var moc
    var body: some View{
            ScrollView(){
                if dataArray.count == 0 {
                    Text("No Data").frame(width: UIScreen.main.bounds.width, height: 50)
                } else {
                    ForEach(0..<(dataArray.count / column)) { i in
                        HStack{
                            ForEach(0..<self.column) { j in
                                CollectionViewCell1(selectedData: self.dataArray[j+(i*self.column)]).environment(\.managedObjectContext, self.moc)
                            }
                        }
                    }
                }
            }
            .onAppear(){
                self.apiCall()
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.apiCall()
                }) {
                    Text("Refresh")
                }
            )
            .navigationBarTitle("Home")
        
    }

    func apiCall() {
        let url:String =  "https://opendata.paris.fr/api/records/1.0/search/?dataset=que-faire-a-paris-&q=que-faire-a-paris-&facet=category&facet=tags&facet=address_zipcode&facet=address_city&facet=pmr&facet=blind&facet=deaf"
        
        AF.request(url).response { response in
            print(response)
            
            switch response.result {
            case .success(let value):
                let json = JSON(value!)
                //                   print(json)
                let jsonString = "\(json["records"].arrayValue)"
                let jsonData = DataModel.stringToJsonObject(stringData: jsonString)
                self.dataArray = DataModel.parseData(dataArray1: jsonData)
                print("Total Count:\(self.dataArray.count)")
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}

struct CollectioView_Previews: PreviewProvider {
    static var previews: some View {
        CollectioView()
    }
}

struct  CollectionViewCell1 : View {
    var selectedData = DataModel()
    let width = (UIScreen.main.bounds.width / 2) - 20
    var title = "1"
    @Environment(\.managedObjectContext) var moc
     var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).frame(width: width, height: width).foregroundColor(.green)
             NavigationLink(destination: DetailView(selectedData: selectedData ).environment(\.managedObjectContext, self.moc)) {
                Text(selectedData.title).padding(20).foregroundColor(.black).frame(width: width, height: width)
            }
        }
    }
    
}
