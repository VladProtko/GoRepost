import UIKit

class LaunchVC: UIViewController {
    
    
    @IBOutlet weak var imageLogo: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let startSize = CGSize(width: 200.0, height: 200.0)
        let endSize = CGSize(width: 400.0, height: 400.0)
        
        let startPosition = CGPoint(x: 87.5, y: 233.5)
        let endPosition = CGPoint(x: startPosition.x - (endSize.width - startSize.height) / 2, y: startPosition.y - (endSize.height - startSize.width) / 2)
        
        imageLogo.frame = CGRect(origin: startPosition, size: startSize)
        
        UIImageView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseIn) {
            self.imageLogo.frame = CGRect(origin: endPosition, size: endSize)
        } completion: { _ in
            self.openMainScreen()
        }

    }

    
    func openMainScreen() {
        
        let nextVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "RepostVC1")
        present(nextVC, animated: true, completion: nil)
       // tabBarController?.viewControllers = [nextVC]
    }
    
}
