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
        
        uploadImage()
    }
    
    func uploadImage() {
        
        let image = imageView.image!
        let data = image.jpegData(compressionQuality: 0.6)!
        
        let uuid = UUID().uuidString
        let ref = Storage.storage().reference(withPath: uuid)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        ref.putData(data, metadata: metadata) { metadata, error in
            print(metadata)
        }
        
    }
    
    
}
