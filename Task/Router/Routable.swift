import UIKit

enum AuthType {
    case login
    case register
}

protocol RouterProtocol  {
    
    func push()
    func push(_ model : User, completion : (Any) -> (UIViewController))
    
    func pop(to : UIViewController)
    func pop(_ model : User, completion : (Any) -> (UIViewController))
    func popToRoot()
    
    func present(vc : UIViewController)
    func dismiss(vc : UIViewController)
    
}

extension RouterProtocol {
    
    func push() {
    }
    func push(_ model : User, completion : (Any) -> (UIViewController)) {
    }
    
    func pop(to : UIViewController) {
    }
    
    func pop(_ model : User, completion : (Any) -> (UIViewController)) {
    }
    
    func popToRoot() {
    }
    
    func present(vc : UIViewController) {
        present(vc: vc)
    }
    
    func dismiss(vc : UIViewController) {
        dismiss(vc: vc)
    }
}



