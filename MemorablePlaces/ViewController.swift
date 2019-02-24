//
//  ViewController.swift
//  MemorablePlaces
//
//  Created by IMCS2 on 2/23/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    var myTitle: String = ""
    
    func start(){
        let latitude: CLLocationDegrees = 32.840744
        let longitude: CLLocationDegrees = -96.994970
        let latDelt: CLLocationDegrees = 0.008
        let longDelta: CLLocationDegrees = 0.008
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpan(latitudeDelta: latDelt, longitudeDelta: longDelta)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
    }
    
    func getPreviousData(){
        latitudes = UserDefaults.standard.value(forKey: "latitudeArray") as! [CLLocationDegrees]
        longitudes = UserDefaults.standard.value(forKey: "longtitudeArray") as! [CLLocationDegrees]
        titles = UserDefaults.standard.value(forKey: "titles") as! [String]
        subTitles = UserDefaults.standard.value(forKey: "subTitles") as! [String]
        for i in 0 ..< titles.count{
            self.addingAnnotation(latitude: latitudes[2 * i], longitude: longitudes[2 * i], title: titles[i], subTitle: subTitles[i])
//            print(latitudes[i])
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        start()
        if(!noData){
            getPreviousData()
        }
        //longpress gesture
        let uiLongPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressAction(gestureRecognizer: )))
        uiLongPress.minimumPressDuration = 2.0
        map.addGestureRecognizer(uiLongPress)
    }
    
    func addingAnnotation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subTitle: String){
        let annotation = MKPointAnnotation()
//        let alert = UIAlertController(title: "Place Description", message: "Enter the description for this place", preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.text = ""
//        }
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//            let textField = alert!.textFields![0]
//            print("Text field: \(textField.text!)")
//            self.myTitle = textField.text!
//        }))
//        self.present(alert, animated: true)
        annotation.title = title
        annotation.subtitle = subTitle
        annotation.coordinate.latitude = latitude
        annotation.coordinate.longitude = longitude
        self.map.addAnnotation(annotation)
    }
    
    
    @objc func longPressAction(gestureRecognizer: UIGestureRecognizer){
        noData = false
        let point = gestureRecognizer.location(in: self.map)
        let coordinates = map.convert(point, toCoordinateFrom: map)
        latitudes.append(coordinates.latitude)
        longitudes.append(coordinates.longitude)
        UserDefaults.standard.set(latitudes, forKey: "latitudeArray")
        UserDefaults.standard.set(longitudes, forKey: "longtitudeArray")
        performSegue(withIdentifier: "mapToInput", sender: nil)
        
    }
}

