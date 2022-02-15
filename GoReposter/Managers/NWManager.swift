import Alamofire
import Foundation

class NWManager {
    
    static let shared = NWManager()
    
    func getContent(url: String, complition: @escaping((ContentModel?) -> Void)) {
            AF.request(url).responseString { response in
            switch response.result {
                case .success:
                    guard let data = response.data else { return }
                    do {
                        let object = try JSONDecoder().decode(PostData.self, from: data)
                        complition(object.reconfigureModel(uri: url))
                    } catch let error {
                        print(error)
                        complition(nil)
                    }
                    break
                case .failure(let error):
                    print(error)
                    complition(nil)
            }
        }
    }
    
    
}
