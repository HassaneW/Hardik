//
//  SearchView.swift
//  NewyorkTimesApi
//
//  Created by Bunti Nizama on 09/10/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import SwiftUI
import Alamofire
import SafariServices

struct ArticleSearchView: View {
    var searchText = ""
     @State var showSafari = false
     @State var urlString = "https://duckduckgo.com"
    @State var dataArray = [Docs]()
    var body: some View {
        VStack {
            if dataArray.count == 0 {
                Text("No Data")
            } else {
                List(dataArray.indices,id: \.self) { index in
                    ListRow(data : self.dataArray[index])
                    .onTapGesture {
                        if self.dataArray[index].web_url != nil {
                            self.urlString = self.dataArray[index].web_url!
                            self.showSafari = true
                        }
                    }
                }
            }
        }
        .onAppear() {
            self.apiCall()
          }
        .sheet(isPresented: $showSafari) {
        SafariView(url:URL(string: self.urlString)!)
        }
    }
    
     func apiCall() {
        let urlStr = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(searchText)&api-key=qNXm2Mzqn9i3gT96DwHA16kAX50UOM6J"
         AF.request(urlStr)
            .validate()
            .responseDecodable(of: MainModel.self) { (response) in
                guard let data = response.value else { return }
                
                if data.response?.docs != nil {
                    self.dataArray = data.response!.docs!
            }
        }
    }
    
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleSearchView()
    }
}

struct ListRow: View {
var data: Docs
 
var body: some View {
    HStack {
        VStack{
            Text("section_name:\(data.section_name ?? "")")
        }
        Spacer()
    }
}
}
