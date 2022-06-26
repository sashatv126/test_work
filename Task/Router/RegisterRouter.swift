import UIKit

class RegisterRouter : Factory {
    
    var nVC: UINavigationController?
    
    init(navigation : UINavigationController) {
        self.nVC = navigation
    }
    
    func show() {
        let vc = createMainModule(router: self)
        nVC?.pushViewController(vc,
                               animated: false)
    }
}

extension RegisterRouter : RouterProtocol {
    
    func push() {
        LoginRouter(navigation: nVC!).show()
    }
}
