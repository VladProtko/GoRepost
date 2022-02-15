import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelHashtags: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction private func didTapCoppy(){
         UIPasteboard.general.string = labelDescription.text
    }
    
    var descriptionPost = String()

    
    func configureCell(model: ContentModel) {
        self.configureButton()
        labelDescription.text = model.caption
    }
    
    func configureButton() {
        button.layer.cornerRadius = 10.0
    }
    
}
