import UIKit
import AlamofireImage

class RepostTableViewCell: UITableViewCell {

    @IBOutlet weak var labelLink: UILabel!
    @IBOutlet weak var labelDiscription: UILabel!
    @IBOutlet weak var imageUrl: UIImageView!
    @IBOutlet weak var imageProfile: UIImageView!
    
   
    
    func set2(instItemModel: ContentModel) {
        imageProfile.layer.cornerRadius = 10.0
        imageUrl.layer.cornerRadius = 15.0
        self.labelDiscription.text = instItemModel.caption
        self.labelLink.text = instItemModel.fromAccName
        
        if let urlProfile = URL.init(string: instItemModel.formAccImage) {
            self.imageProfile.af_setImage(withURL: urlProfile)
        }
       
        
        if let item = instItemModel.content.first {
            if item.type == .image {
                if let urlImage = URL.init(string: item.contentUrl) {
                    self.imageUrl.af_setImage(withURL: urlImage)
                }
            } else {
                print("HERE DECODE VIDEO FRAME")
            }
        }
    }

}



