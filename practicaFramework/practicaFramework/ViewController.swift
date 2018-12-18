//
//  ViewController.swift
//  practicaFramework
//
//  Created by Ronald Ajila on 17/12/2018.
//  Copyright © 2018 Ronald Ajila. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation
import AVKit

class ViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet var _lblLocalization: UILabel!
    @IBOutlet var _btnPlay: UIButton!
    let _locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionPlay(_ sender: Any)
    {
        _locationManager.delegate = self
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
        _locationManager.requestAlwaysAuthorization()
        _locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let _latitude = locations.last!.coordinate.latitude
        let _longitude = locations.last!.coordinate.longitude
        _lblLocalization.text = String(_latitude) + ", " + String(_longitude)
        
        let _locationCurrent = CLLocation(latitude: _latitude, longitude: _longitude)
        
        let _locationSchool = CLLocation(latitude: 40.388987, longitude: -3.629127)
        if (_locationCurrent.distance(from: _locationSchool) < 100) {
            playVideoMedia(uri: "http://aicu.eui.upm.es/~paco/muelle/KY/Summertime.mov")
        }
    }
    
    func playVideoMedia(uri: String) {
        var _playerViewController: AVPlayerViewController!
        _playerViewController = AVPlayerViewController()
        present(_playerViewController, animated: true) {
            let _videoURL = URL(string: uri)
            _playerViewController.player = AVPlayer(url: _videoURL!)
            _playerViewController.player?.play()
        }
    }
}
