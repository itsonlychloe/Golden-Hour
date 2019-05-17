import UIKit
import Firebase

class SecondViewController: UIViewController {
    // layout
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    var annotation: CustomAnnotation!
    
    
//data input pulling right info from firebase
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = annotation.title!
        textView.text = annotation.textView!
        imageView.image = UIImage(named: annotation.title!)
        imageView.clipsToBounds = true
        
    // rounded image 
        imageView.layer.cornerRadius=20
        imageView.clipsToBounds=true
        
        
        textView.layer.cornerRadius=20
        textView.clipsToBounds=true
        
        
    }
    
    
}
