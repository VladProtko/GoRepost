import UIKit
import Alamofire
import AlamofireImage

struct Setting {
    var sections: [String]
    var nameCell: [[String]]
    var imageCell: [[String]]
    
}

class SettingViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    
     var sections = ["How to Repost", "Subscriptions", "Repost app","Support"]
     var nameCell = [["View Tutorial"],
                            ["Upgrade Plan","Restore"],
                            ["Share app", "Rate app"],
                            ["Contact Support", "Privacy Policy", "Terms of use", "Billing terms"]]
     var imageCell = [["tutorial"],
                             ["prem","restore"],
                             ["share", "star"],
                             ["mail", "info", "info1", "info2"]]
    
    @IBAction private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
   
}


extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return sections.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

         return nameCell[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
        
        cell.discriptionSetting.text = nameCell[indexPath.section][indexPath.row]
        cell.imageSetting.image = UIImage(named: imageCell[indexPath.section][indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = self.sections[section]
        
        return section
    }
    
     func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
         
         view.tintColor = .systemGray6
         let header = view as! UITableViewHeaderFooterView
         header.textLabel?.textColor = .lightGray
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let mySetting = nameCell[indexPath.section][indexPath.row]
        
        switch mySetting {
            
        case "View Tutorial":  guard let secondVC = storyboard?.instantiateViewController(identifier: "FirstTutorialVC") as? FirstTutorialVC else {return}
            present(secondVC, animated: true, completion: nil)
        case "Upgrade Plan":  guard let secondVC = storyboard?.instantiateViewController(identifier: "SubscribeVC") as? SubscribeVC else {return}
            present(secondVC, animated: true, completion: nil)
        case "Restore" :    tableView.alpha = 0.5
                            indicator.startAnimating()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    tableView.alpha = 1
                                    self.indicator.stopAnimating()
                                }
                                    
        case "Contact Support":      if let url = URL(string: "https://tlgg.ru/vladprotko") {
                                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
}
        default: break
        
        }
          
    }
    
}
