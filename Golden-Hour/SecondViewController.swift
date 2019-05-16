import UIKit
import Firebase

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    var annotation: CustomAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = annotation.title!
        textView.text = annotation.textView!
        imageView.image = UIImage(named: annotation.title!)
        imageView.clipsToBounds = true
        
        
        imageView.layer.cornerRadius=20
        imageView.clipsToBounds=true
        
        
        textView.layer.cornerRadius=20
        textView.clipsToBounds=true
        
        
    }
    
    
}
