import Foundation
import MapKit
import Firebase

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var textView: String?
    
    
    init(document: DocumentSnapshot) {
        let data = document.data()!
        title = data["Name"] as? String
        let geoPoint = data["Coordinate"] as! GeoPoint
        coordinate = CLLocationCoordinate2D(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
        textView = data ["link"] as? String
   
     }
    
}



//helloooooo
