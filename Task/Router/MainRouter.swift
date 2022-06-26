import UIKit

class MainRouter : Factory,RouterProtocol {
    
    
    private let window : UIWindow
    private let navigationController = UINavigationController()
    
    init(window : UIWindow) {
        navigationController.isNavigationBarHidden = true
        self.window = window
    }
    func initialViewController(type : AuthType ) {
        
        switch type {
        case .login:
            RegisterRouter(navigation: navigationController).show()
        case .register:
            LoginRouter(navigation: navigationController).show()
        }
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
