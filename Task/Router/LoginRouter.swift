import UIKit

class LoginRouter : Factory {
    
    var nVC: UINavigationController?
    
    init(navigation : UINavigationController) {
        self.nVC = navigation
    }
    
    func show() {
        let vc = createSecondModule(router: self)
        nVC?.pushViewController(vc,
                               animated: false)
    }
}

extension LoginRouter : RouterProtocol {
    
    func push() {
        Router(navigation: nVC!).show()
    }
}


