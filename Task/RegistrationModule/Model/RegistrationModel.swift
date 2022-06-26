import Foundation

struct User : Codable {
    
    private var token : String = ""
    
    let name : String
    let sername : String
    let email : String
    let password : String
    let repeatPassword : String
    
    init(name : String,sername : String,email : String,password : String,repeatPassword : String) {
        self.name = name
        self.sername = sername
        self.email = email
        self.password = password
        self.repeatPassword = repeatPassword
    }
    
    mutating func getId() -> String {
        
        token = UUID().uuidString
        
        while DataBase.shared.users.contains(token) {
            token = UUID().uuidString
        }
        
        return token
    }
}
