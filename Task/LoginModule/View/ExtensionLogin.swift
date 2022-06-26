import UIKit
//MARK: -UITextfieldDelegate
extension LoginController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        var text = textField.text ?? ""
        switch textField {
        case emailTextField :
            if !presenter!.checkValidation(text: &text,
                                           validType: .email,
                                           string: string,
                                           range: range,
                                           compare: "") {
                textField.layer.borderColor = UIColor.red.cgColor
                messageLabel.text = "For example : example@ex.com"
            }
            else {
                textField.layer.borderColor = UIColor.black.cgColor
                messageLabel.text = ""
            }
        case passwordTextField :
            if !presenter!.checkValidation(text: &text,
                                           validType: .password,
                                           string: string,
                                           range: range,
                                           compare: "") {
                textField.layer.borderColor = UIColor.red.cgColor
                messageLabel.text = "password consists of minimum 6 symbols"
            }
            else {
                textField.layer.borderColor = UIColor.black.cgColor
                messageLabel.text = ""
            }
        default:
            break
        }
        
        return true
    }
}


