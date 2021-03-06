import UIKit
import MapKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        //  push notif
        let date = Date()
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        print("\(hours):\(minutes)")
        
        
        //map spawn point
        let span = MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
        let region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude:51.246753, longitude: -1.085219), span: span)
        mapView.setRegion(region, animated: true)
        
       //fireatore data push
        let docRef = Firestore.firestore().collection("Locations")
        docRef.getDocuments { snapshot, error in
            for document in snapshot!.documents {
            let annotation = CustomAnnotation(document: document)
                self.mapView.addAnnotation(annotation)
            }
        }
        
        mapView.delegate = self
        
        
        //alert
         goldenHourAlert(title: "Golden Hour", message: "Its Golden Hour in Your Location at 6:30 it is currently: \(hours):\(minutes)")
      
        
    }
    //segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondViewController
        vc.annotation = sender as? CustomAnnotation
    }
    
    //alert
    func goldenHourAlert (title: String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style:  UIAlertAction.Style.default, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        self.present(alert, animated: true, completion: nil )
        
    }
    

}


//segue perfom
extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? CustomAnnotation else { return }
        performSegue(withIdentifier: "Next", sender: annotation)
        mapView.deselectAnnotation(annotation, animated: true)
    }
    
}
func loadLocations() {
}







