import UIKit

class ForecastVC: UIViewController {
    
    
    @IBOutlet weak var tableViewForecast: UITableView!
    
   // var dataSource = [ModelWeather]()  { didSet{ self.tableViewForecast.reloadData() }}
    var dataSourceTest = [ModelWeather(imageWeather: "sun.max", temperature: "22º", time: "13:00", changeNatural: "Clear")] //{ didSet{ self.tableViewForecast.reloadData() }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewForecast.dataSource = self
        tableViewForecast.delegate = self
        

        addLabel()
        view.backgroundColor = .white
    
    }
    
    
    
    func addLabel() {
        // labael - Forecast
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        label.center = CGPoint(x: view.frame.width / 2, y: view.frame.minY + label.frame.height * 2)
        label.textAlignment = .center
        label.text = "Forecast"
        self.view.addSubview(label)
        //  setup lineMulticolors
        let labelLineColor = UILabel(frame: CGRect(x: 0, y: (view.frame.minY + label.frame.height * 2) + 25, width: UIScreen.main.bounds.width + 120, height: 3))
        labelLineColor.textAlignment = .right
        labelLineColor.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        labelLineColor.backgroundColor = .lightGray
        self.view.addSubview(labelLineColor)
        
        let attrString = NSMutableAttributedString(string: " \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\" )
                                
        attrString.addAttributes([.foregroundColor: UIColor.systemPink], range: NSRange(location: 0, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.systemOrange], range: NSRange(location: 13, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.systemGreen], range: NSRange(location: 26, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.systemBlue], range: NSRange(location: 39, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.systemYellow], range: NSRange(location: 52, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.red], range: NSRange(location: 65, length: 13))

        labelLineColor.attributedText = attrString
        
       
    }

    
    
}

extension ForecastVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSourceTest.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell",for: indexPath) as? ForecastTableViewCell
      //  cell.WeatherItemModel(item: dataSource[indexPath.row])
        cell?.WeatherItemModel(item: dataSourceTest[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    
}
