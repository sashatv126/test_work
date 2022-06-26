import Foundation

protocol RegisterPresenterType : AnyObject {
    
    init(view: RegisterViewType,
         network: NetworkService,
         router : RouterProtocol)
    
    var view : RegisterViewType? { get }
    
    var model : User? {get set }
    
    func saveUserToDevice(user : inout User)
    
    func checkValidation(text : inout String,
                         validType : String.ValidTypes,
                         string : String,
                         range : NSRange,
                         compare with : String) -> Bool
    
    func register(user : User)
    
    func moveOnLogin()
}
