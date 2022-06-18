
import UIKit
import Alamofire
import AlamofireImage
import Photos

class RepostVC: UIViewController {

    // MARK: - @IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    // MARK: - @IBActions
    @IBAction func didTapInsta() {
        if let url = URL(string: "http://instagram.com") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func didTapClear() {
        setupAllertDelete()
    }
    
    @IBAction private func didTapTutorial() {
        let nextVC = FirstTutorialVC.getVC(storyboard: .main)
        present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction private func didTapSetting() {
        
        let nextVC = SettingViewController.getVC(storyboard: .main)
        present(nextVC, animated: true, completion: nil)
    }
    @IBAction private func didTapSave() {
        
        
        
        
    }
    
    // MARK: - Properties
    var dataSource = [ContentModel]()  { didSet{ self.tableView.reloadData() }}
    var dataSourceSave = [Post]()  { didSet{ self.tableView.reloadData() }}

    var newLink = ""
    
    
    // MARK: -
    // MARK: - ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupClearButton()
        setupNotification()
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ya na ekrane")
            self.indicator.isHidden = true
            if !UserDefaults.standard.bool(forKey: "first") {
            UserDefaults.standard.set(true, forKey: "first")
            mainView.isHidden = true
            let nextVC = FirstTutorialVC.getVC(storyboard: .main)
            present(nextVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - Configure methods
    func setupNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(appCameToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    func setupClearButton() {
        clearButton.layer.cornerRadius = 15.0
    }
    
    
    
    // MARK: - NWManager methods
    func getResponse() {
        indicator.isHidden = false
        indicator.startAnimating()
        //start
        NWManager.shared.getContent(url: newLink) { model in
            if let data = model {
                self.dataSource.append(data)
            } else {
                self.setupAllertEncorectServer()
                
                print("ERROR SERVER")
            }
            self.indicator.isHidden = true
            self.indicator.stopAnimating()
            //end
        }
    }
    
    // MARK: - Handlers
    @objc func appMovedToBackground() {
        tableView.reloadData()
        
    }
    
    @objc func appCameToForeground() {
        //"https://www.instagram.com/p/CZNLhdIrMQI/?__a=1"
        guard let string = UIPasteboard.general.string else {return}
        if string.hasPrefix("https://www.instagram.com/p/") || string.hasPrefix("https://www.instagram.com/tv/") {
            mainView.isHidden = false
            newLink = string.setupLink()
            if !UserDefaults.standard.bool(forKey: newLink) {
                UserDefaults.standard.set(true, forKey: newLink)
                print(newLink)
                getResponse()
            }
            
        } else {
            setupAllertEncorectLink()
        }
        
    }
    
    // MARK: - Allert methods
    func setupAllertEncorectLink() {
        self.indicator.isHidden = true
        let alert = UIAlertController(title: "WRONG!", message: "ТЫ ПЫТАЕШЬСЯ ВСТАВИТЬ НЕКОРЕКТНУЮ ССЛЫКУ", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok, hide please", style: .destructive) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okButton)
        
        present(alert,animated: true,completion: nil)
    }
    
    func setupAllertDelete() {
        
        let alert = UIAlertController(title: "Delete all active", message: "Do you really want to delete all active posts?", preferredStyle: .actionSheet)
        
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { action in
            alert.dismiss(animated: true, completion: {
                self.mainView.isHidden = true
            })
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        present(alert,animated: true,completion: nil)
    }
    
    func setupAllertEncorectServer() {
        self.indicator.isHidden = true
        let alert = UIAlertController(title: "Error!", message: "Возможно у вас проблемы с интернетом", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok, hide please", style: .destructive) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okButton)
        
        present(alert,animated: true,completion: nil)
    }
    // MARK: - Othr methods
    


}

    

extension RepostVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepostTableViewCell",for: indexPath) as! RepostTableViewCell
            cell.set2(instItemModel: dataSource[indexPath.row])
            return cell
//        } else {
////            let cell2 = tableView.dequeueReusableCell(withIdentifier: "SaveTableViewCell",for: indexPath) as! SaveTableViewCell
////            cell2.set3(instItemModel: dataSource[indexPath.row])
////            return cell2
//
//        }
        
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let secondVC = RepostNowVC.getVC(storyboard: .main)
        secondVC.contentMode = dataSource[indexPath.row]
        present(secondVC, animated: true, completion: nil)

    }
}


