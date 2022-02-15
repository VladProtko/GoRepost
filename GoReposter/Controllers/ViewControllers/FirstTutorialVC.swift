import UIKit

struct ObjectColectionViewTutorial {
    var name: String
    var description: String
    var label: String
    var image: UIImage?
}

class FirstTutorialVC: UIViewController {
    
    
    @IBOutlet weak var collecionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    @IBOutlet weak var continueButton: UIButton!
    
    var nameCell: [String]?
                                                   
    func setupButton() {
        continueButton.layer.cornerRadius = 22.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupButton()
        collecionView.dataSource = self
        collecionView.delegate = self
    }
    
    
    var objectColectionViewTutorial = [ObjectColectionViewTutorial(name: "How to repost", description: "Find a post on Instagram and click", label: "..." ,image: UIImage(named: "tutorial#1")),
                                       ObjectColectionViewTutorial(name: "How to repost", description: "Click on", label: "'Copy Link'", image: UIImage(named: "tutorial#2")),
                                       ObjectColectionViewTutorial(name: "How to repost", description: "Come back to this app and the post will appear.", label: "", image: UIImage(named: "tutorial#3"))]
                       
    @IBAction private func tapEscape() {
        dismiss(animated: true)
    }
    
    @IBAction private func didTapContinue(sender: UIButton) {
        
        let visibleItems: NSArray = self.collecionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        
        if nextItem == IndexPath(item: 3, section: 0){
            dismiss(animated: true)
        }
        
        self.collecionView.scrollToItem(at: nextItem, at: .left, animated: true)
    }
}


extension FirstTutorialVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: 450)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objectColectionViewTutorial.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"TutorialCollectionViewCell", for: indexPath) as? TutorialCollectionViewCell
        
        cell?.setup(object: objectColectionViewTutorial[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pointX = scrollView.contentOffset.x + (scrollView.frame.width / 2.0)
        let pointY = scrollView.bounds.height / 2.0
        
        if let indexPath = collecionView.indexPathForItem(at: CGPoint(x: pointX, y: pointY)) {
            pageView.currentPage = indexPath.row
        }
    }
}
