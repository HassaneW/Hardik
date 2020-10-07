//
//  ViewController.swift
//  GeoFancing
//
//  Created by Bunti Nizama on 25/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Alamofire
import JGProgressHUD
import SwiftyJSON

class ViewController: UIViewController {
    
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var MapView: MKMapView!
    // San José Capital of Costa Rica
    var latitudeInit: Double = 48.864924
    var longitudeInit: Double = 2.330242
    
    var latitudeInit1: Double = 49
    var longitudeInit1: Double = 2.5

    var minimumDistanceForAlert = 25000
    var coordinateInit: CLLocationCoordinate2D {
        return CLLocationCoordinate2D (latitude: latitudeInit, longitude: longitudeInit)
    }
    //https://opendata.paris.fr/api/records/1.0/search/?dataset=adresse_paris&q=&facet=c_ar&facet=b_angle
    let urlString = "https://opendata.paris.fr/api/records/1.0/search/?dataset=adresse_paris&q=&facet=c_ar&facet=b_angle"//"https://opendata.paris.fr/api/datasets/1.0/search/?q=&rows=1000" //"https://opendata.paris.fr/api/records/1.0/search/?dataset=adresse_paris&q=&facet=c_ar&facet=b_angle"
       //https://entreprise.data.gouv.fr/api/rna/v1/id/W9C1000188"
       let hud = JGProgressHUD(style: .dark)
    
    
    var addressList = [Address]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        locationManager.delegate = self
//        // 2
//        locationManager.requestAlwaysAuthorization()
        // 3
//        loadAllGeotifications()
        // Do any additional setup after loading the view.
        
      
        
        let logoutBarButtonItem = UIBarButtonItem(title: "List", style: .done, target: self, action: #selector(goToListPage))

        self.navigationItem.setRightBarButton(logoutBarButtonItem, animated: true)
        
        let span = MKCoordinateSpan (latitudeDelta: 3, longitudeDelta: 3)
        let region = MKCoordinateRegion (center: coordinateInit, span: span)
        MapView.setRegion (region, animated: true)
        MapView.delegate = self
        
        let distanceInMeter =  minimumDistanceForAlert
                 let radius = CLLocationDistance(distanceInMeter)
                 MapView.addOverlay(MKCircle(center: coordinateInit, radius: radius))
        
         self.getAddressFromLatLon(pdblLatitude: "\(latitudeInit)", withLongitude: "\(longitudeInit)")
        self.getAddressFromLatLon(pdblLatitude: "\(latitudeInit1)", withLongitude: "\(longitudeInit1)")
        
        self.getDataFromApi()
    }
    
    @objc func goToListPage(){
        print("goto list page")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listVC = storyboard.instantiateViewController(identifier:"ListViewController" ) as ListViewController
        listVC.addressList = addressList
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
      
        func getDataFromApi(){
            hud.textLabel.text = "Fetching Data From Server"
            hud.show(in: self.view)
            AF.request(urlString, parameters: nil).response { response in
                DispatchQueue.main.async {
    //                self.tableView.reloadData()
                    self.hud.dismiss()
                     switch response.result {
                                case .success(let value):
                                    let json = JSON(value)
                                    if json == JSON.null {
                                        print("error in response :\(json)")
                                        return
                                    }
                                    else {
//                                        self.parceResponse(json: json)
                                        print("response Data :\(json)")
                                        self.addressList.removeAll()
                                        if let dataArray = json["records"].arrayObject {
                                            for data in dataArray {
                                                let address = Address()
                                                address.parceData(json: JSON(data))
                                                if address.lattitude != 0 {
                                                    self.addressList.append(address)
                                                    self.addAnnotaion(title: address.address, city: address.postalCode, lat: address.lattitude, long: address.longitude)
                                                }
                                            }
                                        }
                                    }
                                    break
                                case .failure(let error):
                                    print(error)
                                    break
                                }
                    
                    
                    
                }
            }
    }
    
    
    func addAnnotaion(title : String , city : String , lat : Double , long : Double){
        
        let annotation = WVAnnotation()
        annotation.title = title
        
        
        annotation.subtitle = city
        
        
        annotation.coordinate = CLLocationCoordinate2D (latitude: lat, longitude: long)
        
        MapView.addAnnotation (annotation)
       
        
       
        
    }

    // MARK: add overlay
       func addCircleOverlayFor(annotation: WVAnnotation) {
           let coordinate = annotation.coordinate
           let distanceInMeter =  minimumDistanceForAlert
           let radius = CLLocationDistance(distanceInMeter)
           MapView.addOverlay(MKCircle(center: coordinate, radius: radius))
       }
    
   
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(pdblLatitude)")!
        //21.228124
        let lon: Double = Double("\(pdblLongitude)")!
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon

        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]

                if pm.count > 0 {
                    let pm = placemarks![0]
                    print(pm.country)
                    print(pm.locality)
                    print(pm.subLocality)
                    print(pm.thoroughfare)
                    print(pm.postalCode)
                    print(pm.subThoroughfare)
                    var addressString : String = ""
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    self.addAnnotaion(title: addressString  , city: "" ,lat: lat , long:  lon)

                    print(addressString)
              }
        })

    }

}

extension ViewController :MKMapViewDelegate {

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Authorized status changed")
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse {
            let circularRegion = CLCircularRegion.init(center: (coordinateInit),
                                                       radius: 200.0,
                                                       identifier: "Home")
            circularRegion.notifyOnEntry = true
            circularRegion.notifyOnExit = true
            locationManager.startMonitoring(for: circularRegion)
        }
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
           if overlay is MKCircle {
               let circleRenderer = MKCircleRenderer(overlay: overlay)
               let randomColor = UIColor.red
               circleRenderer.lineWidth = 1.0
               circleRenderer.strokeColor = randomColor
               circleRenderer.fillColor = UIColor.red.withAlphaComponent(0.4)
               return circleRenderer
           }
           return MKOverlayRenderer(overlay: overlay)
       }
    
    
    
}

extension ViewController : CLLocationManagerDelegate{
  
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
     
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
  
}








class WVAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var identifier: String
    
    override init() {
        self.coordinate = CLLocationCoordinate2D()
        self.title = ""
        self.subtitle = ""
        self.identifier = NSUUID().uuidString
    }
}

