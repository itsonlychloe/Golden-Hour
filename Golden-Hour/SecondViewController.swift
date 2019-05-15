import UIKit
import Firebase

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var annotation: CustomAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = annotation.title!
        imageView.image = UIImage(named: annotation.title!)
        imageView.clipsToBounds = true
        
       
        
    }
    
    
}
