import UIKit

class MainViewController : UIViewController {
    
    lazy var image = UIImageView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: 300,
                                               height: 300))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraint()
    }
}

private extension MainViewController {
    
    func setConstraint() {
        view.addSubview(image)
        image.image = UIImage(named: "android")
        image.contentMode = .scaleAspectFill
        image.center = view.center
    }
}
