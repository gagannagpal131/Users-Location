//
//  ViewController.swift
//  Location
//
//  Created by Gagandeep Nagpal on 21/07/16.
//  Copyright © 2016 Gagandeep Nagpal. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    var manager:CLLocationManager!

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        self.manager.requestAlwaysAuthorization()
        self.manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
            
        }
        
        else{
            
            self.manager.requestAlwaysAuthorization()
            self.manager.requestWhenInUseAuthorization()

        }
    
        

    }
    
    
    func locationManager(manager : CLLocationManager, didUpdateLocations locations:[CLLocation]){
        
        
        let userLocation:CLLocation = locations[0]
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.05
        
        let lonDelta:CLLocationDegrees = 0.05
        
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "My Location"
        
        map.addAnnotation(annotation)

        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

