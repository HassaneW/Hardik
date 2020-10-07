//
//  DetailView.swift
//  MatroParis_New
//
//  Created by Bunti Nizama on 07/10/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import SwiftUI
import MapKit
import SVGKit
enum FromPage {
    case shops
    case pictogramme
    case ratp
    case toilettes
}

struct DetailView: View {
    var record = Records()
    var isFrom : FromPage = .shops
    var body: some View {
            VStack(){
                if isFrom == .shops {
                    Text("jour_fermeture : \(record.fields!.jour_fermeture ?? "")")
                    MapView(checkpoint: [Checkpoint(title:record.fields!.nom_commerce! , coordinate: CLLocationCoordinate2D(latitude: record.fields!.coord_geo![0], longitude: record.fields!.coord_geo![1]))], location: CLLocationCoordinate2D(latitude: record.fields!.coord_geo![0], longitude: record.fields!.coord_geo![1]))
                
                    .navigationBarTitle(record.fields!.nom_commerce!)
                }else  if isFrom == .pictogramme  {
                    Text("filename : \(record.fields!.noms_des_fichiers!.filename!)")
                     Text("height : \(record.fields!.noms_des_fichiers!.height!)")
                     Text("width : \(record.fields!.noms_des_fichiers!.width!)")
                    SVGKFastImageViewSUI(url:URL(string:"https://dataratp2.opendatasoft.com/api/v2/catalog/datasets/\(record.datasetid!)/files/\(record.fields!.noms_des_fichiers!.id!)")!).frame(width: 300, height: 300, alignment: .center)
    //                 Text("jour_fermeture : \(record.fields!.noms_des_fichiers!.thumbnail!)")
                } else if isFrom == .ratp {
                    Text("RATP")
                    Text("nomptar : \(record.fields!.nomptar ?? "")")
                                 MapView(checkpoint: [Checkpoint(title:record.fields!.nomptar ?? "" , coordinate: CLLocationCoordinate2D(latitude: record.fields!.coord![0], longitude: record.fields!.coord![1]))], location: CLLocationCoordinate2D(latitude: record.fields!.coord![0], longitude: record.fields!.coord![1]))
                } else {
                    VStack(){
                    Text("gestionnaire :\(record.fields!.gestionnaire ?? "")")
                        Text("hors_zone_controlee_station :\(record.fields!.hors_zone_controlee_station ?? "")")
                        Text("ligne :\(record.fields!.ligne ?? "")")
                        Text("accessible_au_public :\(record.fields!.accessible_au_public ?? "")")
                        Text("tarif_gratuit_payant :\(record.fields!.tarif_gratuit_payant ?? "")")
                        Text("localisation :\(record.fields!.localisation ?? "")")
                        Text("station :\(record.fields!.station ?? "")")
                    }
                        Text("accessibilite_pmr :\(record.fields!.accessibilite_pmr ?? "")")
                        Text("acces_bouton_poussoir :\(record.fields!.acces_bouton_poussoir ?? "")")
                    MapView(checkpoint: [Checkpoint(title:record.fields!.gestionnaire ?? "" , coordinate: CLLocationCoordinate2D(latitude: record.fields!.coord_geo![0], longitude: record.fields!.coord_geo![1]))], location: CLLocationCoordinate2D(latitude: record.fields!.coord_geo![0], longitude: record.fields!.coord_geo![1]))
                     .navigationBarTitle(record.fields!.gestionnaire ?? "")
                }
            }
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
         DetailView(record: Records())
    }
}

struct MapView: UIViewRepresentable  {
  @State var checkpoint: [Checkpoint]
    var location : CLLocationCoordinate2D
  var locationManager = CLLocationManager()
  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
  
    func makeUIView(context: Context) -> MKMapView {
        //    setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.delegate = context.coordinator
        let distanceInMeter =  2500
        let radius = CLLocationDistance(distanceInMeter)
        mapView.addOverlay(MKCircle(center: location, radius: radius))
        
        mapView.setRegion(region, animated: true)
        return mapView
    }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.addAnnotations(checkpoint)
  }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
  
}


final class Checkpoint: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D
  
  init(title: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}

 class Coordinator: NSObject, MKMapViewDelegate{

    var parent: MapView
    init(_ parent: MapView) {
        self.parent = parent
    }

    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
         parent.location = mapView.centerCoordinate
     }

     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         let identifier = "PlaceMark"
         var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
         if annotationView == nil {
             annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
             annotationView?.canShowCallout = true
             annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)

         } else {
             annotationView?.annotation = annotation
         }

         return annotationView
     }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
               if overlay is MKCircle {
                   let circleRenderer = MKCircleRenderer(overlay: overlay)
                   let randomColor = UIColor.red
                   circleRenderer.lineWidth = 1.0
                   circleRenderer.strokeColor = randomColor
                   circleRenderer.fillColor = UIColor.green.withAlphaComponent(0.5)
                   return circleRenderer
               }
               return MKOverlayRenderer(overlay: overlay)
           }

//     func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//         guard let placemark = view.annotation as? MKPointAnnotation else {return}
//         parent.selectedPlace = placemark
//         parent.showingPlaceDetails = true
//
//     }

    }

struct SVGKFastImageViewSUI:UIViewRepresentable
{
  var url:URL
  func makeUIView(context: Context) -> SVGKFastImageView {
    
    //let svg = URL(string: url)!
   // let data = try? Data(contentsOf: url)
    let svgImage = SVGKImage(contentsOf: url)
    return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
     
  }
  func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
     
  }
   
   
}
struct SVGImage_Previews: PreviewProvider {
  static var previews: some View {
    SVGKFastImageViewSUI(url:URL(string:"https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/android.svg")!)
  }
}


