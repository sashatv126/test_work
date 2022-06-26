import Foundation

enum HTTP {
    enum Method : String {
        case get = "GET"
        case post = "POST"
    }
}

protocol Request {
    var resourceURL : URL { get }
    
    var endpoint : String {get set }
}

extension Request {
    
    var resourceURL : URL {
        
        let resourceString = "http://94.127.67.113:8099/methods/\(endpoint)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        return resourceURL
    }
}

protocol NetworkService : Request {
    
    func getAnswer<T : Codable>(model : T ,_ completion: @escaping (NetworkError?) -> (Void))
    
}

class Network : NetworkService {
    
    var endpoint: String
    
    init(endpoint : String) {
        self.endpoint = endpoint
    }
    
    func getAnswer<T : Codable>(model : T ,_ completion: @escaping (NetworkError?) -> (Void))  {
        
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = HTTP.Method.post.rawValue
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(model)
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    completion(.responseError)
                    return
                }
                completion(nil)
            }
            task.resume()
        } catch {
            completion(.serverProblem)
        }
        
    }
}
