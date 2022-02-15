import UIKit

extension UIViewController {
    
   static func getVC(storyboard: UIStoryboard) -> Self {
        return storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! Self
       
    }
}

