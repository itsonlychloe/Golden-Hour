import UIKit
import MapKit
import Firebase

class ViewController: UIViewController {
    
    //ghjgygh
    
    @IBOutlet weak var mapView: MKMapView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        let span = MKCoordinateSpan(latitudeDelta: 3.0, longitudeDelta: 3.0)
        let region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude:51.246753, longitude: -1.085219), span: span)
        mapView.setRegion(region, animated: true)
        
       
        let docRef = Firestore.firestore().collection("Locations")
        docRef.getDocuments { snapshot, error in
            for document in snapshot!.documents {
            let annotation = CustomAnnotation(document: document)
                self.mapView.addAnnotation(annotation)
            }
        }
        
        mapView.delegate = self
        
      
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondViewController
        vc.annotation = sender as? CustomAnnotation
    }
    
}

extension ViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? CustomAnnotation else { return }
        performSegue(withIdentifier: "Next", sender: annotation)
        mapView.deselectAnnotation(annotation, animated: true)
    }
    
}
func loadLocations() {
}







