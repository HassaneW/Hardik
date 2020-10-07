/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/

import SwiftUI

struct ListRow: View {
    var person: Person

    var body: some View {
        HStack {
            Image(uiImage: person.image)
                .resizable()
                .frame(width: 50, height: 50)
                .border( Color.black, width: 1)
                .padding(10)
            Text(person.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListRow(person: Person(name: "Miller", image: UIImage(named: "Art1" )!))
//            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
