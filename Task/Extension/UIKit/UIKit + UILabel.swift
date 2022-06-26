import UIKit

extension UILabel {
    
    convenience init(title : String?,
                     backGroundColor : UIColor = .clear,
                     fornt : UIFont? = .systemFont(ofSize: 50),
                     cornerRadus : CGFloat = 10) {
        self.init()
        self.text = title
        self.backgroundColor = backGroundColor
        self.textAlignment = .center
        self.font = fornt
        self.layer.cornerRadius = cornerRadus
    }
}
