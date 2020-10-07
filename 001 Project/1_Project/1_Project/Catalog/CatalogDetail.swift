//
//  catalogDetail.swift
//  1_Project
//
//  Created by Bunti Nizama on 17/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct CatalogDetail: View {
    var title : String = "test"
    var img1 :String = ""
    var img2 :String = ""
    var img3 :String = ""
    var img4 :String = ""
    @Environment(\.presentationMode) var pres
    var body: some View {
        ScrollView(){
            ZStack(alignment: .top) {
                // << made explicit alignment to top
                
                VStack(spacing: 0) {
                    
                    VStack(spacing: 0){
                        HStack(spacing: 0){
                             
                            CatelogDetailItem(image: img1)
                            CatelogDetailItem(image: img2)
                        }
                        .background(Color("Color"))
                        HStack(spacing: 0){
                            CatelogDetailItem(image: img3)
                            CatelogDetailItem(image: img4)
                        }
                        .background(Color("Color"))

                        HStack(spacing: 0){
                            CatelogDetailItem(image: img1)
                            CatelogDetailItem(image: img2)
                        }
                        .background(Color("Color"))
                        HStack(spacing: 0){
                            CatelogDetailItem(image: img3)
                            CatelogDetailItem(image: img4)
                        }
                        .background(Color("Color"))
                    }
                    .background(Color("Color"))
                    
                    
                }
                .foregroundColor(Color.black.opacity(0.7))
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                .offset(x: 0, y: 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Color("Color"))
            
            //        .edgesIgnoringSafeArea(.bottom)
            
        }
        .background(Color("Color"))
        .navigationBarTitle(title)
        .navigationBarColor(UIColor.backgourfOfApplication)
    }
    
}

struct catalogDetail_Previews: PreviewProvider {
    static var previews: some View {
        CatalogDetail()
    }
}

struct CatelogDetailItem:View {
    var image : String
    
    var body: some View{
        NavigationLink(destination: ListDetail(person: Person(name: "test", image: UIImage(named: image )!)) ) {
            HStack{
                Image(uiImage:  UIImage(named: self.image )!)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(0)
                    .border(Color.black ,width: 2)
                    .background(Color.white)
                    .overlay(Text("test").padding(5), alignment: .bottom)
            }
            
          
        }
        
    }
}




