
import UIKit
import Foundation

extension String {
    
    func setupLink() -> String {
        
        var bufferArray: [String] = []
        let endLink = "/?__a=1"
        var results = ""
        var buffer = "/"
        
        if self.hasPrefix("https://www.instagram.com/p/") || self.hasPrefix("www.instagram.com/p/") ||
            self.hasPrefix("instagram.com/p/") {
            let listItems = self.components(separatedBy: "/")
            
            for char in listItems {
                if char.count == 11{
                    buffer.append(char)
                }
            }
            for char in self {
                
                if char == "o"{
                    results.append("om/p")
                    break
                } else {
                    results.append(char)
                }
            }
            let link = results + buffer + endLink
            
            return link
        } else{
       
        if self.hasPrefix("https://www.instagram.com/tv/") || self.hasPrefix("www.instagram.com/tv/") ||
        self.hasPrefix("instagram.com/tv/") {
        let listItems = self.components(separatedBy: "/")
        
        for char in listItems {
            if char.count == 11{
                buffer.append(char)
            }
        }
        for char in self {
            
            if char == "o"{
                results.append("om/tv")
                break
            } else {
                results.append(char)
            }
        }
        
    }
    return results + buffer + endLink

}
    }
}
