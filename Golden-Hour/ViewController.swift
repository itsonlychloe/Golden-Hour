import UIKit
import MapKit
import Firebase

class ViewController: UIViewController {
    
    //ghjgygh
    
    @IBOutlet weak var mapView: MKMapView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        //Get coordinates
        let neilsYardCoord = CLLocationCoordinate2D(latitude: 51.515248, longitude: -0.130173)
        let stPaulsCathCoord = CLLocationCoordinate2D(latitude: 51.513822, longitude: -0.096474)
        let leadenHallMarkCoord = CLLocationCoordinate2D(latitude: 51.511463, longitude: -0.085413)
        let kingsCrossLightCoord = CLLocationCoordinate2D(latitude: 51.532002, longitude: -0.119304)
        let healsOfLondonCoord = CLLocationCoordinate2D(latitude: 51.521299, longitude: -0.134605)
        let nhMueseumCoord = CLLocationCoordinate2D(latitude: 51.496563, longitude: -0.176892)
        let piccadillyCircusCoord = CLLocationCoordinate2D(latitude: 51.510090, longitude: -0.134568)
        let paintedGalleryCoord = CLLocationCoordinate2D(latitude: 51.482018, longitude: -0.008728)
        let burlingtonArcadeCoord = CLLocationCoordinate2D(latitude: 51.509181, longitude: -0.140333)
        let stPancrasCoord = CLLocationCoordinate2D(latitude: 51.529634, longitude: -0.125992)
        let camdenTownCoord = CLLocationCoordinate2D(latitude: 51.539188, longitude: -0.142500)
        let leakeStreetCoord = CLLocationCoordinate2D(latitude: 51.501787, longitude: -0.115468)
        
        let portlandBillCoord = CLLocationCoordinate2D(latitude: 50.514351, longitude: -2.456629)
        let portlandHeightsCoord = CLLocationCoordinate2D(latitude: 50.555934, longitude: -2.442339)
        let chesilBeachCoord = CLLocationCoordinate2D(latitude:50.558499, longitude: -2.447950)
        let portlandCastleCoord = CLLocationCoordinate2D(latitude:50.568347, longitude:-2.446657)
        let churchOpeCoveCoord = CLLocationCoordinate2D(latitude:50.538285, longitude:-2.428018)
        let notheGardensCoord = CLLocationCoordinate2D(latitude:50.606490, longitude:-2.445175)
        
        
        //annotation for the coordinates
        let neilsYardAnnotation = CustomAnnotation(coordinate:neilsYardCoord, title: "Neils Yard")
        let stPaulsCathAnnotation = CustomAnnotation(coordinate:stPaulsCathCoord, title: "St Pauls Cathedral")
        let leadenHallAnnotation = CustomAnnotation(coordinate: leadenHallMarkCoord, title: "LeadenHall Market")
        let kingsCrossLightAnnotation = CustomAnnotation(coordinate: kingsCrossLightCoord, title: "Kings Cross Light Tunnel")
        let healsOfLondonAnnotation = CustomAnnotation(coordinate: healsOfLondonCoord, title: "Heals of London")
        let nhMuesumAnnotation = CustomAnnotation(coordinate: nhMueseumCoord, title: "National History Museum")
        let piccadillyCircusAnnotation = CustomAnnotation(coordinate: piccadillyCircusCoord, title: "Piccadilly Circus")
        let paitedGalleryAnnotation = CustomAnnotation(coordinate: paintedGalleryCoord, title: "The Painted Gallery")
        let burlingtonArcadeAnnotation = CustomAnnotation(coordinate: burlingtonArcadeCoord, title: "Burlington Arcade")
        let stPancrasAnnotation = CustomAnnotation(coordinate: stPancrasCoord, title: "St Pancras Renaissance Hotel")
        let camdenTownAnnotation = CustomAnnotation(coordinate: camdenTownCoord, title: "Camden Town")
        let leakeStreetAnnotation = CustomAnnotation(coordinate: leakeStreetCoord, title: "Leake Street Graffiti Tunnel")
        
        let portlandBillAnnotation = CustomAnnotation(coordinate: portlandBillCoord, title: "Portland Bill")
        let portlandHeightsAnnotation = CustomAnnotation(coordinate: portlandHeightsCoord, title: "Portland Heights")
        let chesilBeachAnnotation = CustomAnnotation(coordinate: chesilBeachCoord, title: "Chesil Beach")
        let portlandCastleAnnotation = CustomAnnotation(coordinate: portlandCastleCoord, title: "Portland Castle")
        let churchOpeCoveAnnotation = CustomAnnotation(coordinate: churchOpeCoveCoord, title: "Church Ope Cove")
        let notheGardensAnnotation = CustomAnnotation(coordinate: notheGardensCoord, title: "Nothe Gardens")
        
        
        mapView.addAnnotations([neilsYardAnnotation, stPaulsCathAnnotation,  leadenHallAnnotation, kingsCrossLightAnnotation, healsOfLondonAnnotation, nhMuesumAnnotation, piccadillyCircusAnnotation, paitedGalleryAnnotation, burlingtonArcadeAnnotation, stPaulsCathAnnotation, stPancrasAnnotation, camdenTownAnnotation, leakeStreetAnnotation])
        
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


//test
