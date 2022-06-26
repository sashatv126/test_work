import UIKit

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: 70, width: 300, height: 50))
    toastLabel.backgroundColor = UIColor.clear.withAlphaComponent(0)
    toastLabel.layer.borderColor = UIColor.red.cgColor
    toastLabel.layer.borderWidth = 2
    toastLabel.textColor = UIColor.red
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    })
} }
