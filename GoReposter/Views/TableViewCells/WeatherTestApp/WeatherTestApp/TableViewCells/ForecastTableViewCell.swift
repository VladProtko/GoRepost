import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var imageWeather: UIImageView!
    @IBOutlet  weak var temperature: UILabel!
    @IBOutlet private weak var time: UILabel!
    @IBOutlet private weak var changeNatural: UILabel!
    

    func WeatherItemModel(item: ModelWeather) {
        
        self.imageWeather.image = UIImage(named: item.imageWeather)
        self.temperature.text = item.temperature
        self.time.text = item.time
        self.changeNatural.text = item.changeNatural
        
    }
    
}
