import Foundation

final class RegisterPresenter : RegisterPresenterType {
    
    internal weak var view: RegisterViewType?
    private var network : NetworkService?
    private var router : RouterProtocol?
    
    var model: User?
    
    required init(view: RegisterViewType, network: NetworkService, router : RouterProtocol) {
        self.view = view
        self.network = network
        self.router = router
    }
    
    func saveUserToDevice(user: inout User) {
        DataBase.shared.saveUsers(user: &user)
    }
    
    func register(user: User) {
        network!.getAnswer(model: user) { networkError in
            DispatchQueue.main.async {
                if networkError == nil {
                    self.view?.sucess()
                }
                else {
                    self.view?.failure(error: networkError!)
                }
            }
        }
    }
    
    func checkValidation(text : inout String,
                         validType : String.ValidTypes,
                         string : String,
                         range : NSRange,
                         compare with : String) -> Bool {
        
        let result : String
        let str = (text ) + string
        if range.length == 1 {
            let end = text.index(str.startIndex, offsetBy: str.count-1)
            result = String(str[str.startIndex..<end])
        }
        else {
            result = str
        }
        text = result
        
        if result == with {
            return true
        }
        if result.isValid(validType: validType) {
            return true
        }
        
        return false
    }
    
    func moveOnLogin() {
        router?.push()
    }
}
