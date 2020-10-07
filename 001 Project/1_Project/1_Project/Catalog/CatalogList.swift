//
//  CatalogList.swift
//  1_Project
//
//  Created by Bunti Nizama on 14/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI

struct CatalogList: View {
    @State  var catalogDetail = CatalogDetail(title: "Art de vivre", img1: "Art1", img2: "Art2", img3: "Art3", img4: "Art4")
    @State private var willMoveToNextScreen = false
    @State var show = false

    
     var body: some View {
        NavigationView{
            ZStack(alignment: .top) {
                // << made explicit alignment to top

                VStack(spacing: 0) {
                    
                    VStack{
                        HStack{
                            NavigationLink(destination:CatalogDetail(title: "Art de vivre", img1: "Art1", img2: "Art2", img3: "Art3", img4: "Art4")) {
                                    CatelogItem(image: Image("landmark") , title: "Art de vivre").padding(10)
                                           }
                           
                            NavigationLink(destination:CatalogDetail(title: "Cadran", img1: "Cad1", img2: "Cad2", img3: "Cad3", img4: "Cad4")) {
                                CatelogItem(image: Image("watch"), title: "Cadrans").padding(10)
                          
                            }
                        }
                        .background(Color("Color"))
                        HStack{
                             NavigationLink(destination:CatalogDetail(title: "Male", img1: "male1", img2: "male2", img3: "male3", img4: "male4")) {
                                CatelogItem(image: Image("male"), title: "Male").padding(10)
                            }
                            
                             NavigationLink(destination:CatalogDetail(title: "Woman", img1: "female1", img2: "female2", img3: "female3", img4: "female4")) {
                                CatelogItem(image: Image("woman"), title: "Woman").padding(10)
                            }
                        }
                        .background(Color("Color"))
                        
                    }
                    .background(Color("Color"))
                    .padding(.top, 30)
                    
                }
                .foregroundColor(Color.black.opacity(0.7))
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                .offset(x: 0, y: 0)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Color("Color"))
//            .navigate(to:catalogDetail, when: $willMoveToNextScreen)
            
             .navigationBarTitle("Catalog")
             .navigationBarColor(UIColor.backgourfOfApplication)
        }            
         .background(Color("Color"))

       
                     
                  
        }
    
    
        
    }

//    var body: some View {
//        ZStack(alignment: .top) {
//            // << made explicit alignment to top
//            HStack { // << moved this up to ZStack
//                Text("Catelog")
//                    .fontWeight(.bold)
//                    .multilineTextAlignment(.center)
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
//                    .font(.body)
//            }
//            .frame(minWidth: 0, maxHeight: 10, alignment: .topLeading)
//            VStack(spacing: 0) {
//
//                VStack{
//                    HStack{
//
//                        CatelogItem(image: Image("landmark") , title: "Art de vivre").padding(10)
//                            .background(Color.clear)
//                            .onTapGesture {
//                                self.catalogDetail =  CatalogDetail(title: "Art de vivre", img1: "Art1", img2: "Art2", img3: "Art3", img4: "Art4")
//                                self.willMoveToNextScreen = true
//                        }
//                        CatelogItem(image: Image("watch"), title: "Cadrans").padding(10)
//                        .onTapGesture {
//                                self.catalogDetail =  CatalogDetail(title: "Cadran", img1: "Cad1", img2: "Cad2", img3: "Cad3", img4: "Cad4")
//                                self.willMoveToNextScreen = true
//                        }
//                    }
//
//                    .background(Color("Color"))
//                    HStack{
//
//                        CatelogItem(image: Image("male"), title: "Male").padding(10)
//                        CatelogItem(image: Image("woman"), title: "Woman").padding(10)
//                    }
//                    .background(Color("Color"))
//
//                }
//                .background(Color("Color"))
//                .padding(.top, 30)
//
//            }
//            .foregroundColor(Color.black.opacity(0.7))
//            .padding()
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
//            .offset(x: 0, y: 0)
//        }
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
//        .background(Color("Color"))
//        .navigate(to:catalogDetail, when: $willMoveToNextScreen)
//
//        //        .edgesIgnoringSafeArea(.bottom)
//    }
//
//}
    
    


struct CatalogList_Previews: PreviewProvider {
    static var previews: some View {
       
        CatalogList()
        
    }
}


struct CatelogItem:View {
    var image : Image
    var title : String = ""
    var body: some View{
        VStack {
            //This is Label
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(10)
            Text(title)
                .padding(.bottom, 10)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(LinearGradient.lairDiagonalDarkBorder, lineWidth: 2)
        )
            .background(Color.gray)
            .cornerRadius(15)
            .shadow(color: Color.gray.opacity(0.5), radius: 14, x: -2, y: -2)
            .shadow(color: Color.gray.opacity(0.5), radius: 14, x: 2, y: 2)
        
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}

struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .black

    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

