import Foundation

enum CustomError: Error,LocalizedError {
    
    case userNotFound
    case errorWithRegister
    case errorWithLogin
    
    public var errorDescription : String? {
        
        switch self{
            
        case .userNotFound:
           return "User not found"
        case .errorWithRegister:
           return "Register end with error"
        case .errorWithLogin:
           return "Login end with error"
        }
    }
}

enum NetworkError : Error, LocalizedError {
     
    case responseError
    case decodingError
    case serverProblem
    
    public var errorDescription : String? {
        
        switch self{
   
        case .responseError:
            return "Response is not answered"
        case .decodingError:
            return "Error with decoding json"
        case .serverProblem:
            return "Server is crahed"
        }
    }
}
