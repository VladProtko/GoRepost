

import UIKit

class HowToRepostVC: UIViewController {

    @IBAction private func didTapTutorial() {
        
        let nextVC = FirstTutorialVC.getVC(storyboard: .main)

       present(nextVC, animated: true, completion: nil)
        
    }
    
    @IBAction private func didTapSetting() {
        
        let nextVC = SettingViewController.getVC(storyboard: .main)

       present(nextVC, animated: true, completion: nil)
        
    }

    
}
