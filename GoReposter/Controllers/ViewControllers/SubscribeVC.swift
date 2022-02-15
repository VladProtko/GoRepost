
import UIKit

class SubscribeVC: UIViewController {

    @IBOutlet weak var imagesAnimation: UIView!
    
    @IBOutlet weak var popular: UIView!
    @IBOutlet weak var best: UIView!
    @IBOutlet weak var royal: UIView!
    @IBOutlet weak var continueButtuon: UIButton!
    

    
    
    func setupButtons() {
        continueButtuon.layer.cornerRadius = 20.0
        popular.layer.cornerRadius = 10.0
        royal.layer.cornerRadius = 10.0
        best.layer.cornerRadius = 10.0

    }
    

    func setupAnimation() {
        
        let startPosition: CGFloat = 20.0
        let endPosition = UIScreen.main.bounds.width - 20.0 - imagesAnimation.frame.width
        
        imagesAnimation.frame.origin.x = startPosition
        
        UIView.animate(withDuration: 10.0, delay: 0.0, options: [.curveEaseInOut, .repeat, .autoreverse  ]) {
            self.imagesAnimation.frame.origin.x = endPosition

        }
        }
        
    func setupNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(appCameToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func appMovedToBackground() {
   }

    @objc func appCameToForeground() {
     setupAnimation()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()
        setupButtons()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupAnimation()
    }
    
    @IBAction private func didTapCancel() {
        dismiss(animated: true)
    }
    
    @IBAction private func didTapContinue() {
        dismiss(animated: true)
    }
    
    
    @IBAction func didTapView(recognaizer: UITapGestureRecognizer) {
        guard let selectedView = recognaizer.view else {return}
             
        switch selectedView {
            
        case popular: popular.alpha = 1
                      best.alpha = 0.5
                      royal.alpha = 0.5
        case best: best.alpha = 1
                      popular.alpha = 0.5
                      royal.alpha = 0.5
        case royal: royal.alpha = 1
                      best.alpha = 0.5
                      popular.alpha = 0.5
        default:
            break
        }
        }
        
    }

