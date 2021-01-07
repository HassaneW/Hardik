//
//  BooksView.swift
//  NewyorkTimesApi
//
//  Created by Bunti Nizama on 09/10/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import SwiftUI
import Alamofire
import SafariServices

struct BooksListView: View {
    var searchText = ""
      @State var showSafari = false
      @State var urlString = "https://duckduckgo.com"
     @State var records = [Book]()
    let column:Int = 2

    var body: some View {
        VStack{
            if records.count == 0 {
                Text("No Data")
            } else {
                ScrollView(){
                    VStack {
                        
                        ForEach(0..<(records.count / column)) { i in
                            HStack{
                                ForEach(0..<self.column) { j in
                                    CollectionViewCell1(data: self.records[j+(i*self.column)])
                                        .onTapGesture {
                                            if self.records[j+(i*self.column)].url != nil {
                                                self.urlString = self.records[j+(i*self.column)].url!
                                                self.showSafari = true
                                            }
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
            
        .navigationBarTitle("Book List")
            
            .sheet(isPresented: $showSafari) {
                SafariView(url:URL(string: self.urlString)!)
        }
    }
    
    func apiCall() {
           let urlStr = "https://api.nytimes.com/svc/books/v3/reviews.json?author=\(searchText)&api-key=qNXm2Mzqn9i3gT96DwHA16kAX50UOM6J"
            AF.request(urlStr)
               .validate()
               .responseDecodable(of: BookApiModel.self) { (response) in
                   guard let data = response.value else { return }
                   
                   if data.results != nil {
                       self.records = data.results!
               }
           }
       }
}

struct BooksListView_Previews: PreviewProvider {
    static var previews: some View {
        BooksListView()
    }
}

struct  CollectionViewCell1 : View {
    var data: Book
    let width = (UIScreen.main.bounds.width / 2) - 20
    var title = "1"
     var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).frame(width: width, height: width).foregroundColor(.green)
                 ZStack{
                    Text("\(data.book_title ?? "")").padding(20).foregroundColor(.black).frame(width: width, height: width)
                }
        }
    }
}
