import UIKit

class HastagsTableViewCell: UITableViewCell {


    @IBOutlet  weak var nameHashtag: UILabel!
    @IBOutlet  weak var discriptionHashtag: UILabel!
    @IBOutlet  weak var cellView: UIView!
    
    
    @IBAction private func didTapCoppy(){
        
        UIPasteboard.general.string = discriptionHashtag.text
    }

}
