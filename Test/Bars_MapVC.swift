//
//  Bars_MapVC.swift
//  Test
//
//  Created by Thad Duval on 1/8/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit
import MapKit

class Bars_MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
 
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        if let loc = userLocation.location {
            
            if !mapHasCenteredOnce {
                centerMapOnLocation(location: loc)
                mapHasCenteredOnce = true
            }
        }
        
    }
    
    @IBAction func pressedRecenterMapButton(_ sender: Any) {
        
        mapView.setCenter(mapView.userLocation.coordinate, animated: true)
        
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        
//        let annoIdentifier = "Pokemon"
//        var annotationView: MKAnnotationView?
//        
//        if annotation.isKind(of: MKUserLocation.self) {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
//            annotationView?.image = UIImage(named: "ash")
//        } else if let deqAnno = mapView.dequeueReusableAnnotationView(withIdentifier: annoIdentifier) {
//            annotationView = deqAnno
//            annotationView?.annotation = annotation
//        } else {
//            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annoIdentifier)
//            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//            
//            annotationView = av
//        }
//        
//        if let annotationView = annotationView, let anno = annotation as? PokeAnnotation {
//            annotationView.canShowCallout = true
//            annotationView.image = UIImage(named: "\(anno.pokemonNumber)")
//            
//            let btn = UIButton()
//            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//            btn.setImage(UIImage(named: "map"), for: .normal)
//            annotationView.rightCalloutAccessoryView = btn
//            
//        }
//        
//        return annotationView
//    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        //let loc = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        
    }
    
}
