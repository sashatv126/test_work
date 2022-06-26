import UIKit

class RegisterController : UIViewController {
    //MARK: -Properties
    var presenter : RegisterPresenterType!
    
    private lazy var scrollView = UIScrollView(frame: view.bounds)
    private lazy var surnameTextField = CustomTextField(placeholder: "Sername")
    private lazy var repeatPasswordTextField = CustomTextField(placeholder: "Repeat password")
    private lazy var registerButton = UIButton(title: "Register",
                                       titleColor: .black,
                                       backGroundColor: .white)
    private lazy var registerLabel = UILabel(title: "Hello",
                                     backGroundColor: .white,
                                     cornerRadus: 10)
    
    lazy var emailTextField = CustomTextField(placeholder: "Email")
    lazy var passwordTextField = CustomTextField(placeholder: "Password")
    lazy var nameTextField = CustomTextField(placeholder: "Name")
    
    
    lazy var messageLabel : UILabel = {
        let message = UILabel(title: "",
                              fornt: .systemFont(ofSize: 14))
        message.textColor = .red
        return message
    }()
    //MARK: -LifeCircle
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstrints()
        setRightViewIcon(passwordTextField)
        setRightViewIcon(repeatPasswordTextField)
        setTextField()
    }
    //MARK: -SupportedInterfaceOrientations
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       AppUtility.lockOrientation(.portrait)
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       
       AppUtility.lockOrientation(.all)
   }
    
    @objc private func tapOnRegister() {
        
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let repeatPaswword = passwordTextField.text ?? ""
        if !name.isEmpty && !surname.isEmpty && !email.isEmpty && !password.isEmpty && !repeatPaswword.isEmpty {
            if email.isValid(validType: .email) && password.isValid(validType: .password) && name.isValid(validType: .name) {
                var user = User(name: nameTextField.text ?? "",
                                sername: surnameTextField.text ?? "",
                                email: emailTextField.text ?? "",
                                password: passwordTextField.text ?? "",
                                repeatPassword: repeatPasswordTextField.text ?? "")
                presenter.register(user: user)
                DataBase.shared.saveUsers(user: &user)
            } else {
                self.showToast(message: "Not all filled good", font: .systemFont(ofSize: 24))
            }
        } else {
            self.showToast(message: "Fill all fields", font: .systemFont(ofSize: 24))
        }
    }
}
//MARK: -SetConstraints
private extension RegisterController {
    
    func setConstrints() {
        view.backgroundColor = .white
        
        registerButton.addTarget(nil,
                                 action: #selector(tapOnRegister),
                                 for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [nameTextField,
                                                       surnameTextField
                                                       ,emailTextField,
                                                       passwordTextField,
                                                       repeatPasswordTextField],
                                    axis: .vertical,
                                    spacing: 40)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(registerButton)
        scrollView.addSubview(registerLabel)
        scrollView.addSubview(messageLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            registerLabel.widthAnchor.constraint(equalToConstant: 200),
            registerLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 6),
            messageLabel.widthAnchor.constraint(equalToConstant: 300),
            messageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setTextField() {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true
    }
    //MARK: -SetRightViewIcon
    func setRightViewIcon(_ textField : UITextField) {
        var password = UIButton.Configuration.plain()
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: ((passwordTextField.frame.height) * 0.70), height: ((passwordTextField.frame.height) * 0.70)))
        password.image = UIImage(named: "eye")
        btnView.addTarget(nil, action: #selector(setSecurity), for: .touchUpInside)
        btnView.configuration = password
        textField.rightViewMode = .whileEditing
        textField.rightView = btnView
    }
    
    @objc
    func setSecurity() {
        
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        repeatPasswordTextField.isSecureTextEntry = !repeatPasswordTextField.isSecureTextEntry
    }
}
//MARK: -Presenter's delegate
extension RegisterController : RegisterViewType {
    func sucess() {
        presenter.moveOnLogin()
    }
    func failure(error: Error) {
        self.showToast(message: error.localizedDescription, font: .systemFont(ofSize: 24))
    }
    
}

