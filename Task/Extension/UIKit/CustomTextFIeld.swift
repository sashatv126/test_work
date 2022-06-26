import Foundation
import UIKit

class CustomTextField : UITextField {
    
    convenience init(placeholder : String) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        setTextField(placeholder: placeholder)
    }
}

private extension CustomTextField {
    
    func setTextField(placeholder : String) {
        self.borderStyle = .roundedRect
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.font = .systemFont(ofSize: 30)
        self.placeholder = placeholder
    }
}
