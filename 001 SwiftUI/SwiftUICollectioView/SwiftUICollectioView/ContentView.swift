import SwiftUI


struct ContentView: View {
    @State var listData = postData
    @State private var showAlert = false
     @State var alertMsg = ""

    func showAlert(isdisplay : Bool) {
            self.showAlert = isdisplay
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listData) { items in
//                    ForEach(0..<2) { item in
                    HStack{
                        CollectionView(data: items).frame(width: (UIScreen.main.bounds.width - 10) / 2, height: 100).onTapGesture {
                            self.alertMsg = items.body
                            self.showAlert = true
                        }

                        CollectionView(data: items).frame(width: (UIScreen.main.bounds.width - 10) / 2, height: 100).onTapGesture {
                            self.alertMsg = items.body
                            self.showAlert = true
                        }
//                    }
                    }
                }
                }.navigationBarTitle("CollectionView")
        }.alert(isPresented: $showAlert) {
            Alert(
                title: Text("Body"),
                message: Text(alertMsg)
            )
        }
    }
}


//For Alert
//struct ContentView: View {
//    @State private var showingAlert = false
//
//    var body: some View {
//        Button(action: {
//            self.showingAlert = true
//        }) {
//            Text("Show Alert")
//        }
//        .alert(isPresented: $showingAlert) {
//            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
//        }
//    }
//}
struct CollectionView: View {
    let data: Post
  
    var body: some View {
        VStack {
            HStack {
                Text(self.data.title)
                    
        
                    
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: (UIScreen.main.bounds.width - 100) / 2, height: 80)
                .background(
                    ZStack {
                        Color(#colorLiteral(red: 0.4938853979, green: 0.5476876497, blue: 0.6575545669, alpha: 0.5))
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(.white)
                            .blur(radius: 4)
                            .offset(x: -4, y: -4)
                        
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            //.foregroundColor(Color(#colorLiteral(red: 0.4938853979, green: 0.5476876497, blue: 0.6575545669, alpha: 0.5)))
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4938853979, green: 0.5476876497, blue: 0.6575545669, alpha: 0.5)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    
                    .shadow(color: Color(#colorLiteral(red: 0.4938853979, green: 0.5476876497, blue: 0.6575545669, alpha: 0.5)), radius: 20, x: 20, y: 20)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
                
                //                Text(self.data.name)
                Spacer()
            }
       
            
            
            
            
        }
        
//        .alert(isPresented: $showAlert) {
//            Alert(
//                title: Text("Test"),
//                message: Text(alertMsg)
//            )
//        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}
