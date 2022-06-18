
import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageTutorial: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    @IBOutlet weak var label: UILabel!

  

    
    func setup(object: ObjectColectionViewTutorial) {
        
        imageTutorial.image = object.image
        name.text = object.name
        descriptions.text = object.description
        label.text = object.label
    }
    

}

