import UIKit

class ViewController: UITabBarController {
    
    let todayWeatherVC = TodayWeatherVC()
    let forecastVC = ForecastVC()
    var arr = ["Today", "Forecast"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupTabBar()
      
    }
    
        func setupTabBar() {

            self.viewControllers = [todayWeatherVC,forecastVC]
            
        guard let items = self.tabBar.items  else {return}
        
            
            
        let images = ["sun.max","cloud.moon"]
            
            for i in 0...1 {
                items[i].image = UIImage(systemName: images[i])
                items[i].title = arr[i]
        }
    }
}
