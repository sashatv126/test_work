import UIKit

protocol Factory {
    

    func createMainModule(router : RouterProtocol) -> UIViewController
    func createSecondModule(router : RouterProtocol) -> UIViewController
    func createThirdModule(router : RouterProtocol) -> UIViewController
}

extension Factory {
    
    func createMainModule(router : RouterProtocol) -> UIViewController {
        let view = RegisterController()
        let network = Network(endpoint: "registerUser")
        let presenter = RegisterPresenter(view: view,
                                          network: network,
                                          router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createSecondModule(router : RouterProtocol) -> UIViewController {
        let view = LoginController()
        let network = Network(endpoint: "checkUser")
        let presenter = LoginViewPresenter(view: view,
                                           network: network,
                                           router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createThirdModule(router : RouterProtocol) -> UIViewController {
        let view = MainViewController()
        
        return view
    }
}
