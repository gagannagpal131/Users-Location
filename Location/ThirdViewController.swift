//
//  ThirdViewController.swift
//  Location
//
//  Created by Gagandeep Nagpal on 21/07/16.
//  Copyright © 2016 Gagandeep Nagpal. All rights reserved.
//

import UIKit
import CoreLocation

class ThirdViewController: UIViewController,CLLocationManagerDelegate{
    
    
    @IBOutlet var userLongitude: UILabel!
        
    @IBOutlet var userLatitude: UILabel!
    
    @IBOutlet var userAltitude: UILabel!
    
    @IBOutlet var userSpeed: UILabel!
    
    @IBOutlet var userAddress: UILabel!
    
    var manager:CLLocationManager!
    
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
    
    
    
        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let userLocation:CLLocation = locations[0]
            
            self.userLatitude.text = "\(userLocation.coordinate.latitude)"
            
            self.userLongitude.text = "\(userLocation.coordinate.longitude)"
            
            self.userSpeed.text = "\(userLocation.speed)"
            
            self.userAltitude.text = "\(userLocation.altitude)"
            
          
            CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
                
                if (error != nil) {
                    
                    print(error)
                    
                } else {
                    
                    self.userAddress.text = "\(placemarks![0].locality!)\n\(placemarks![0].administrativeArea!)\n\(placemarks![0].postalCode!)\n\(placemarks![0].country!)"
                    
                }
                
            })

        
        
        

    }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
