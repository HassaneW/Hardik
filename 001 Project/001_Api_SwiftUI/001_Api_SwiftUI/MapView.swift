//
//  MapView.swift
//  001_Api_SwiftUI
//
//  Created by Bunti Nizama on 25/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView1: View {
    var selectedData = DataModel()

    var body: some View {
        MapView(selectedData: selectedData).edgesIgnoringSafeArea(.all)
    }
}

struct MapView1_Previews: PreviewProvider {
    static var previews: some View {
        MapView1()
    }
}

struct MapView: UIViewRepresentable {
    var selectedData = DataModel()

    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.centerCoordinate =  CLLocationCoordinate2D(latitude: selectedData.lattitude, longitude: selectedData.longitude)
        let annotation = MKPointAnnotation()
        annotation.title = selectedData.address_name
        annotation.subtitle = selectedData.address_city
        annotation.coordinate = CLLocationCoordinate2D(latitude: selectedData.lattitude, longitude: selectedData.longitude)
        mapView.addAnnotation(annotation)
        
        let distanceInMeter = convertToMeterFrom(mile: 500)
        let radius = CLLocationDistance(distanceInMeter)
        mapView.addOverlay(MKCircle(center: mapView.centerCoordinate, radius: radius))
        return mapView
    }
    
   

    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
    
    // MARK: Convert mile to meter
    func convertToMeterFrom(mile: Int) -> Int{
        return mile * 1609
    }
}
