//
//  AppDelegate.swift
//  CarPlayExample
//
//  Created by Bunti Nizama on 16/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import UIKit
import CarPlay

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,CPApplicationDelegate  {

    let viewController : CarPlayViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "CarPlayViewController")
     let mapTemplate = CPMapTemplate()
    var listControlTemplate : CPListTemplate!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    func application(_ application: UIApplication, didConnectCarInterfaceController interfaceController: CPInterfaceController, to window: CPWindow) {
//        guard let origin = UserDefaults.standard.dictionary(forKey: "_origin") as? [String: CLLocationDegrees],
//           let destination = UserDefaults.standard.dictionary(forKey: "_destination") as? [String: CLLocationDegrees],
//           let directions = UserDefaults.standard.array(forKey: "_directions") as? [[String: Any]] else {
//             return // No active route
//           }
//        let test = CPSearchTemplate()
//        test.delegate = self
//      //UIViewController(nibName: "TestViewController", bundle: nil)
//        window.rootViewController = viewController
        
        
    
//        var interfaceControl = CPInterfaceController()
        
//        mapTemplate.tripEstimateStyle = .dark
//        mapTemplate.guidanceBackgroundColor = .green
//
//        let trip = CPTrip(origin: MKMapItem(placemark: MKPlacemark(coordinate: _locationFrom(dictionary: origin))),
//                             destination: MKMapItem(placemark: MKPlacemark(coordinate: _locationFrom(dictionary: destination))),
//                             routeChoices: [CPRouteChoice(summaryVariants: _summaryVariantsFrom(array: directions),
//                                                          additionalInformationVariants: _additionalInformationVariantsFrom(array: directions),
//                                                          selectionSummaryVariants: [])])
//
//           interfaceController.setRootTemplate(mapTemplate, animated: true)
//           mapTemplate.startNavigationSession(for: trip)
        
//        let voiceControlState = CPVoiceControlState(identifier: "test", titleVariants: ["test title"], image: UIImage(named: "1"), repeats: true)
        
//        let cplistitem = CPListItem(text: "test list item", detailText: "detail")
//        let cplist = CPListSection(items: [cplistitem,cplistitem,cplistitem,cplistitem,cplistitem,cplistitem,cplistitem,cplistitem], header: "", sectionIndexTitle: "section index")
         listControlTemplate = CPListTemplate(title: "test", sections: [cplist])//CPVoiceControlTemplate(voiceControlStates: [voiceControlState])
        listControlTemplate.delegate = self
        
        
        
//        carInterfaceController = CPInterfaceController(
        interfaceController.setRootTemplate(listControlTemplate, animated: true)
      }
    
    func testCode(){
    }
    
    func application(_ application: UIApplication, didDisconnectCarInterfaceController interfaceController: CPInterfaceController, from window: CPWindow) {
        
    }
    
    
    /// MARK: Internal utilities to unserialize our dictionaries of route steps
    
    private func _locationFrom(dictionary: [String: CLLocationDegrees]) -> CLLocationCoordinate2D {
      guard let latitude = dictionary["latitude"], let longitude = dictionary["longitude"] else { return kCLLocationCoordinate2DInvalid }
      return CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    private func _summaryVariantsFrom(array: [[String: Any]]) -> [String] {
      var variants: [String] = []
    
      for direction in array {
        if let name = direction["name"] as? String {
          variants.append(name)
        }
      }
      
      return variants;
    }
    
    private func _additionalInformationVariantsFrom(array: [[String: Any]]) -> [String] {
      var additionalInformationVariants: [String] = []
      
      for routes in array {
        guard let advisoryNotices = routes["advisoryNotices"] as? [String] else { return [] }
        for advisoryNotice in advisoryNotices {
          additionalInformationVariants.append(advisoryNotice)
        }
      }
      
      return additionalInformationVariants
    }
}

extension AppDelegate : CPSearchTemplateDelegate {
    func searchTemplate(_ searchTemplate: CPSearchTemplate, selectedResult item: CPListItem, completionHandler: @escaping () -> Void) {
        print("selectec Item")
    }
    
    func searchTemplate(_ searchTemplate: CPSearchTemplate, updatedSearchText searchText: String, completionHandler: @escaping ([CPListItem]) -> Void)
    {
        var dataArray = [CPListItem]()
        let item = CPListItem()
        item.setValue("test", forKey: "detailText")//detailText = "test1"
        dataArray.append(item)
        
        let item1 = CPListItem()
               item1.setValue("test", forKey: "detailText")
        dataArray.append(item1)
          print("updatedSearchText")
        completionHandler(dataArray)
        
      
        
    }
     func searchTemplateSearchButtonPressed(_ searchTemplate: CPSearchTemplate){
        print("searchTemplateSearchButtonPressed")
    }
}


extension AppDelegate : CPListTemplateDelegate {
    func listTemplate(_ listTemplate: CPListTemplate, didSelect item: CPListItem, completionHandler: @escaping () -> Void) {
        
        
        print(item.text as Any)
    }
    
    
}


