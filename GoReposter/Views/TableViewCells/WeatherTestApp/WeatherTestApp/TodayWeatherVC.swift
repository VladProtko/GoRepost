import UIKit

class TodayWeatherVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addLabel()
        view.backgroundColor = .white

    }
    

    func addLabel() {
        // labael - Today
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 25))
        label.center = CGPoint(x: view.frame.width / 2, y: view.frame.minY + label.frame.height * 2)
        label.textAlignment = .center
        label.text = "Today"
        self.view.addSubview(label)
        
        //  setup lineMulticolors
        let labelLineColor = UILabel(frame: CGRect(x: 0, y: (view.frame.minY + label.frame.height * 2) + 25, width: UIScreen.main.bounds.width + 120, height: 3))
        labelLineColor.textAlignment = .right
        labelLineColor.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        labelLineColor.backgroundColor = .lightGray
        self.view.addSubview(labelLineColor)
        
        let attrString = NSMutableAttributedString(string: "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
        
        attrString.addAttributes([.foregroundColor: UIColor.systemPink], range: NSRange(location: 0, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.systemOrange], range: NSRange(location: 13, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.systemGreen], range: NSRange(location: 26, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.systemBlue], range: NSRange(location: 39, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.systemYellow], range: NSRange(location: 52, length: 13))
        attrString.addAttributes([.foregroundColor: UIColor.red], range: NSRange(location: 65, length: 13))
        
        labelLineColor.attributedText = attrString
        
        // setup imageWeatherConditions
        let imageWeatherConditons = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width / 2) - 50
                                                              , y: (UIScreen.main.bounds.width / 2) - 80, width: 100, height: 100))
        imageWeatherConditons.image = UIImage(systemName: "sun.max")
        imageWeatherConditons.tintColor = .yellow
        self.view.addSubview(imageWeatherConditons)
        
        // setup label city
        let labelCity = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 2) - 100, y: (UIScreen.main.bounds.height / 4) + 30 , width: 200, height: 50))
        labelCity.textAlignment = .center
        labelCity.text = "London, UK"
        self.view.addSubview(labelCity)
        
        //setup label degree
        let labelDegree = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 4), y: (UIScreen.main.bounds.height / 4) + 70 , width: 200, height: 50))
        labelDegree.textAlignment = .center
        labelDegree.textColor = .systemBlue
        labelDegree.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        labelDegree.text = "22ºC  |  Sunny"
        self.view.addSubview(labelDegree)
        
        //setup firstSeparator
        let firstSeparator = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 4), y: (UIScreen.main.bounds.height / 2)  , width: 400, height: 3))
        firstSeparator.textAlignment = .left
        firstSeparator.textColor = .lightGray
        firstSeparator.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        firstSeparator.text = "----------------------"
        self.view.addSubview(firstSeparator)
        
        
        //setup secondSeparator
        let secondSeparator = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 4), y: (UIScreen.main.bounds.height / 4) + (UIScreen.main.bounds.height / 4) + (UIScreen.main.bounds.height / 4) + 15 , width: 400, height: 3))
        secondSeparator.textAlignment = .left
        secondSeparator.textColor = .lightGray
        secondSeparator.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        secondSeparator.text = "----------------------"
        self.view.addSubview(secondSeparator)
        
        // setup imageWeatherConditions1
        let imageWeatherConditions1 = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width / 10)
                                                              , y: (UIScreen.main.bounds.height / 2) + 25, width: 50, height: 50))
        imageWeatherConditions1.image = UIImage(systemName: "sun.max")
        imageWeatherConditions1.tintColor = .yellow
        imageWeatherConditions1.addDashedBorder()
       
        self.view.addSubview(imageWeatherConditions1)
        
        
        //setup labelWeatherConditions
        
        let labelWeatherConditions = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 10) + 12.5
                                                           , y: (UIScreen.main.bounds.height / 2) + 60, width: 70, height: 50))
        labelWeatherConditions.text = "57%"
        labelWeatherConditions.font = UIFont.systemFont(ofSize: 15, weight: .medium)
               
        self.view.addSubview(labelWeatherConditions)
        
    
        // setup imageWeatherConditions2
        let imageWeatherConditions2 = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width / 4) + 5
                                                              , y: (UIScreen.main.bounds.height / 2) + 100, width: 50, height: 50))
        imageWeatherConditions2.image = UIImage(systemName: "sun.max")
        imageWeatherConditions2.tintColor = .yellow
        imageWeatherConditions2.addDashedBorder()

        self.view.addSubview(imageWeatherConditions2)
        
        //setup labelWeatherConditions2
        let labelWeatherConditions2 = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 4)
                                                           , y: (UIScreen.main.bounds.height / 2) + 135, width: 70, height: 50))
        labelWeatherConditions2.text = "20 km/h"
        labelWeatherConditions2.font = UIFont.systemFont(ofSize: 15, weight: .medium)
               
        self.view.addSubview(labelWeatherConditions2)

     
        // setup imageWeatherConditions3
        let imageWeatherConditions3 = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width / 2 - 25)
                                                              , y: (UIScreen.main.bounds.height / 2) + 25, width: 50, height: 50))
        imageWeatherConditions3.image = UIImage(systemName: "sun.max")
        imageWeatherConditions3.tintColor = .yellow
        imageWeatherConditions3.addDashedBorder()

        self.view.addSubview(imageWeatherConditions3)
        
        //setup labelWeatherConditions3
        let labelWeatherConditions3 = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 2 - 25)
                                                            , y: (UIScreen.main.bounds.height / 2) + 60, width: 70, height: 50))
        labelWeatherConditions3.text = "1.0 mm"
        labelWeatherConditions3.font = UIFont.systemFont(ofSize: 15, weight: .medium)
               
        self.view.addSubview(labelWeatherConditions3)

        
        
        // setup imageWeatherConditions4
        let imageWeatherConditions4 = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width / 4) + (UIScreen.main.bounds.width / 4) + 32.5
                                                              , y: (UIScreen.main.bounds.height / 2) + 100, width: 50, height: 50))
        imageWeatherConditions4.image = UIImage(systemName: "sun.max")
        imageWeatherConditions4.tintColor = .yellow
        imageWeatherConditions4.addDashedBorder()

        self.view.addSubview(imageWeatherConditions4)
        
        //setup labelWeatherConditions4
        
        let labelWeatherConditions4 = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 4) + (UIScreen.main.bounds.width / 4) + 32.5
                                                           , y: (UIScreen.main.bounds.height / 2) + 135, width: 50, height: 50))
        labelWeatherConditions4.text = "SE"
        labelWeatherConditions4.textAlignment = .center
        labelWeatherConditions4.font = UIFont.systemFont(ofSize: 15, weight: .medium)
               
        self.view.addSubview(labelWeatherConditions4)
        
        // setup imageWeatherConditions5
        let imageWeatherConditions5 = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.width / 4 ) + (UIScreen.main.bounds.width / 4) + (UIScreen.main.bounds.width / 4)
                                                              , y: (UIScreen.main.bounds.height / 2) + 25, width: 50, height: 50))
        imageWeatherConditions5.image = UIImage(systemName: "sun.max")
        imageWeatherConditions5.tintColor = .yellow
        imageWeatherConditions5.addDashedBorder()

        self.view.addSubview(imageWeatherConditions5)
        
        //setup labelWeatherConditions5
        
        let labelWeatherConditions5 = UILabel(frame: CGRect(x: (UIScreen.main.bounds.width / 4 ) + (UIScreen.main.bounds.width / 4) + (UIScreen.main.bounds.width / 4) - 12.5
                                                            , y: (UIScreen.main.bounds.height / 2) + 60, width: 70, height: 50))
        labelWeatherConditions5.text = "1019 hPa"
        labelWeatherConditions5.textAlignment = .center
        labelWeatherConditions5.font = UIFont.systemFont(ofSize: 15, weight: .medium)
               
        self.view.addSubview(labelWeatherConditions5)
        
        // setup button Share
        
        let buttonShare = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width / 2 - 50) , y: (UIScreen.main.bounds.height / 4) + (UIScreen.main.bounds.height / 4) + (UIScreen.main.bounds.height / 4) , width: 100, height: 100))
        buttonShare.setTitle("Share", for: .normal)
        buttonShare.setTitleColor(.orange, for: .normal)
        
        self.view.addSubview(buttonShare)
        
}
}


