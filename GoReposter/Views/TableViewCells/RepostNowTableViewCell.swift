
import UIKit

class RepostNowTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!


    var modelImages = [ContentItem]()
    
 
    override  func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
  
    func setup(InstalModel: Shortcode_media) {
        
    }
}

extension RepostNowTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelImages.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RepostNowCollectionViewCell", for: indexPath) as? RepostNowCollectionViewCell else { return UICollectionViewCell()}
        
        cell.setupINST(InstalModel: modelImages[indexPath.row])
        
        self.pageView.numberOfPages = modelImages.count

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width , height: 550)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let pointX = scrollView.contentOffset.x + (scrollView.frame.width / 2.0)
        let pointY = scrollView.bounds.height / 2.0
        
        if let indexPath = collectionView.indexPathForItem(at: CGPoint(x: pointX, y: pointY)) {
            pageView.currentPage = indexPath.row
        }
    }
}
