import UIKit

class RepostNowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageInstagram: UIImageView!
 
    
    func setupINST(InstalModel: ContentItem) {
        
        switch InstalModel.type {
        case .image:
            if let url = URL.init(string: InstalModel.contentUrl) {
                self.imageInstagram.af_setImage(withURL: url)
            }
        case .video:
            print("Configure video content")
        }
        
        
    }
}


