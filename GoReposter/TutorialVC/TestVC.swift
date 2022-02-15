
import UIKit

class TestVC: UIViewController {

    @IBAction private func didTapTutorial() {
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "FirstTutorialVC") as! FirstTutorialVC
        
       present(nextVC, animated: true, completion: nil)
        
    }
    

}
