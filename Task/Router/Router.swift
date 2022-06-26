import UIKit

class Router : Factory {
    
    var nVC: UINavigationController?
    
    init(navigation : UINavigationController) {
        self.nVC = navigation
    }
    
    func show() {
        let vc = createThirdModule(router: self)
        nVC?.pushViewController(vc,
                               animated: false)
    }
}

extension Router : RouterProtocol {
    
    func push() {
        LoginRouter(navigation: nVC!).show()
    }
}

