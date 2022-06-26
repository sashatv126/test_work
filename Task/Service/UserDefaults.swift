import Foundation

class DataBase {
    
    static let shared = DataBase()
    
    enum SettingKeys : String {
        case user
    }
    
    let defaults = UserDefaults.standard
    let userKey = SettingKeys.user.rawValue
    
    var users : [String] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data {
                return try! PropertyListDecoder().decode([String].self, from: data)
            }
            else {
                return [String]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data,forKey: userKey)
            }
        }
    }
    
    func saveUsers( user : inout User)  {
        
        let token = user.getId()
        
        users.append(token)
    }
}
