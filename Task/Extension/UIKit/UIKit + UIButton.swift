import UIKit

extension UIButton {
    
    convenience init(title : String?,
                     titleColor : UIColor,
                     backGroundColor : UIColor,
                     fornt : UIFont? = .systemFont(ofSize: 30),
                     isShadow : Bool = false,
                     cornerRadus : CGFloat = 10) {
        self.init(type : .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backGroundColor
        self.titleLabel?.font = fornt
        self.layer.cornerRadius = cornerRadus
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 1
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
}
