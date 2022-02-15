import Foundation

private let TUTORIAL_KEY = "poherchtotutpistglavnoectotonovoedatipravna100procentov"
private let CONTENT_KEY = "CONTENT_KEY"



class UDManager {
    
    static let shared = UDManager()
    
    private let standard = UserDefaults.standard
    
    func userSeenTutorial() -> Bool {
        return standard.bool(forKey: TUTORIAL_KEY)
    }
    
    func userCloseTutorial() {
        standard.set(true, forKey: TUTORIAL_KEY)
    }
    
    func setHistoryItem(model: ContentModel) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(model), forKey: CONTENT_KEY)
        
//        if !UserDefaults.standard.bool(forKey: "first") {
//        UserDefaults.standard.set(true, forKey: "first")
       
    }
    
//    func getHistory() -> [ContentModel] {
//        if let data = UserDefaults.standard.value(forKey:CONTENT_KEY) as? Data {
//            
//            if let lastContent = try? PropertyListDecoder().decode(Array<ContentModel>.self, from: data) {
//                
//                
//                return lastContent
//            }
//            
//            // func getItems -> masivItems
//            
//           
//        }
//    }
}
