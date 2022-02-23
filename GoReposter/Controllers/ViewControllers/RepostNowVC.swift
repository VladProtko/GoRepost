import UIKit
import Photos
import Alamofire
import AlamofireImage

class RepostNowVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    // MARK: - IBActions
    @IBAction private func didTapEscape() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func didTapRepost() {
        repostHandler()
      
        
    }
    
    var contentMode: ContentModel?
    
    
    // MARK: -
    // MARK: - ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.isHidden = true
                
        if let content = contentMode {
            labelName.text = content.fromAccName
        }
    }
    
    func repostHandler() {
        guard let content = self.contentMode else { return }
        
        if let cell = self.tableView.cellForRow(at: .init(row: 0, section: 0)) as? RepostNowTableViewCell {
            let indexPath =  cell.collectionView.indexPathsForVisibleItems.first
            
            guard let url = URL.init(string: content.content[indexPath!.row].contentUrl) else { return } 
        self.indicator.isHidden = false
        self.indicator.startAnimating()
        self.tableView.alpha = 0.5
        DispatchQueue.global(qos: .background).async {
            guard let urlData = NSData(contentsOf: url) else { return }
            
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let filePath="\(documentsPath)/repostV.jpg" // if video????? .mp4 save file
            DispatchQueue.main.async {
                urlData.write(toFile: filePath, atomically: true)
                                                
                let title = "Repost"
                
                let activityVC = UIActivityViewController(activityItems: [title,
                                                                          NSURL(fileURLWithPath: filePath)],
                                                          applicationActivities: nil)
                activityVC.excludedActivityTypes = [.assignToContact]
                self.present(activityVC, animated: true) {
                    print("GOOOD")
                    self.tableView.alpha = 1
                    self.indicator.isHidden = true
                    self.indicator.stopAnimating()
                }
                
                activityVC.completionWithItemsHandler = { (activityType, completed:Bool, returnedItems:[Any]?, error: Error?) in
                   if completed {
//                    self.allertSucces(info: activityType.debugDescription)
//                    let _ = DefaultsManager.shared.videoReposted()
                   }
                }
            }
        }
    }
    }

    
    
    
    
}

extension RepostNowVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
       if indexPath.row % 2 == 0 {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepostNowTableViewCell",for: indexPath) as?  RepostNowTableViewCell else {return UITableViewCell()}

           if let contentData = self.contentMode {
               cell.modelImages = contentData.content
           }
            return cell
        } else {
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell",for: indexPath) as?  DescriptionTableViewCell else {return UITableViewCell()}
            if let model = contentMode {
                cell2.configureCell(model: model)
            }
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
}

