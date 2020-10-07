//
//  ViewController.swift
//  GoogleMap_Example
//
//  Created by Bunti Nizama on 19/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {

    @IBOutlet weak var mapView : GMSMapView!
    var placesClient: GMSPlacesClient!
    var likelyPlaces: [GMSPlace] = []
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMap()
        self.addMarker()
        self.loadCurrentLocation()
        // Do any additional setup after loading the view.
    }
    var long = 151.200000
    var lat = -33.860000
    let zoom = 10
    func loadMap(){
        let camera = GMSCameraPosition.camera(withLatitude:lat,
                                              longitude: long, zoom: Float(zoom))
        self.mapView.camera = camera
        self.mapView.isMyLocationEnabled = true
        
        placesClient = GMSPlacesClient.shared()
    }
    
    func addMarker(){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = "Title"
        marker.snippet = "Description"
        marker.map = mapView
    }
    
    func loadCurrentLocation(){
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func searchPlaces(){
//     https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.860000,151.200000&radius=5000&keyword=restorent&key=AIzaSyDqnwCj4eybAqYesso8cgbBCkGS5ySce1s
    }
    
    func fetchRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {

       let origin = "\(source.latitude),\(source.longitude)"
        let destination = "\(destination.latitude),\(destination.longitude)"

        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=\(GOOGLE_KEY)"

        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    let routes = json["routes"] as! NSArray
                    self.mapView.clear()

                    OperationQueue.main.addOperation({
                        for route in routes
                        {
                            let routeOverviewPolyline:NSDictionary = (route as! NSDictionary).value(forKey: "overview_polyline") as! NSDictionary
                            let points = routeOverviewPolyline.object(forKey: "points")
                            let path = GMSPath.init(fromEncodedPath: points! as! String)
                            let polyline = GMSPolyline.init(path: path)
                            polyline.strokeWidth = 3

                            let bounds = GMSCoordinateBounds(path: path!)
                            self.mapView!.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 30.0))

                            polyline.map = self.mapView

                        }
                    })
                }catch let error as NSError{
                    print("error:\(error)")
                }
            }
        }).resume()
    }

    func drawPath(from polyStr: String){
        let path = GMSPath(fromEncodedPath: polyStr)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 3.0
        polyline.map = mapView // Google MapView
    }


}

extension ViewController :CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
           print("locations = \(locValue.latitude) \(locValue.longitude)")
        lat = locValue.latitude
        long = locValue.longitude
        self.loadMap()
        self.addMarker()
    }
}

