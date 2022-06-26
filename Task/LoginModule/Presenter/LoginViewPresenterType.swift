import Foundation

protocol LoginViewPresenterType : AnyObject {
    
    init(view: LoginViewType,
         network: NetworkService,
         router : RouterProtocol)
    
    var view : LoginViewType? { get }
    
    var model : User? {get set }
    
    func login(user : LoginUser)
    
    func checkValidation(text : inout String,
                         validType : String.ValidTypes,
                         string : String,
                         range : NSRange,
                         compare with : String) -> Bool
    
    func moveOnMain()
}

