import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var currentLocation = CLLocation(latitude: 34.984337, longitude: 135.757797)
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let address = ["東京都杉並区宮前", "東京都港区六本木2-2-6", "青森県八戸市新田松山"]
        
        for count in 0...2 {
        
        CLGeocoder().geocodeAddressString(address[count]) { placemarks, error in
            if let lat = placemarks?.first?.location?.coordinate.latitude {
                print("\(address[count]) : \(lat)")
            }
            if let lng = placemarks?.first?.location?.coordinate.longitude {
                print("\(address[count]) : \(lng)")
            }
        }
        
        }
        
        //ロケーションマネージャの設定
        self.locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            
            self.locationManager.delegate = self
            self.locationManager.distanceFilter = 10
            self.locationManager.startUpdatingLocation()
        }

        Spot.sortedList(nearFrom: currentLocation).forEach({ spot in
            print("\(spot.name) (\(spot.distance!)m)")
        })
        
    }
    
    func locationManager( _ manager: CLLocationManager, didUpdateLocations locations: [ CLLocation ] ) {
        //表示更新
            self.currentLocation = locations.first!
            print("\(self.currentLocation)")
    }
}
