

import SwiftUI



struct TabBarScreen: View {
  @State var selectedItem = SmartView.login
  @Environment(\.managedObjectContext) var managedObjectContext

  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        ZStack {
          if self.selectedItem == .login {
            LoginScreen().environment(\.managedObjectContext, self.managedObjectContext)
            CatalogList().hidden()
            NewTabScreen().hidden()
            MagazineScreenView().hidden()

          } else if self.selectedItem == .catalog {
            LoginScreen().hidden()
            CatalogList()
            NewTabScreen().hidden()
            MagazineScreenView().hidden()


          } else if self.selectedItem == .new {

           LoginScreen().hidden()
           CatalogList().hidden()
           NewTabScreen()
            MagazineScreenView().hidden()

          } else {
            LoginScreen().hidden()
            CatalogList().hidden()
            NewTabScreen().hidden()
             MagazineScreenView()
          }
        }
        
        
        TabBarView(
          selectedItem: self.$selectedItem,
          tabBarItems: [
            TabBarItemView(
              selectedItem: self.$selectedItem,
              smartView: .login, icon: "house.fill"),
            TabBarItemView(
              selectedItem: self.$selectedItem,
              smartView: .catalog, icon: "book.circle.fill"),
            TabBarItemView(
              selectedItem: self.$selectedItem,
              smartView: .new, icon: "alarm"),
            TabBarItemView(
              selectedItem: self.$selectedItem,
              smartView: .settings, icon: "gear")
        ])
          .padding(.bottom, geometry.safeAreaInsets.bottom / 2)
          .background(Color.lairBackgroundGray)
      }
      .edgesIgnoringSafeArea(.bottom)
    }
  }
}

struct TabBarScreen_Previews: PreviewProvider {
  static var previews: some View {
    TabBarScreen()
  }
}



//struct MyTabView: View {
//
//    @State var selection = 0
//
//    var body: some View {
//        TabView(selection: $selection) {
//            LoginScreen()
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("")
//            }.tag(0)
//            CatalogList()
//                .tabItem {
//                    Image(systemName: "book.circle.fil")
//                    Text("Swift UI")
//            }.tag(1)
//
//        }
//    }
//}
//
//struct MyTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTabView()
//    }
//}
