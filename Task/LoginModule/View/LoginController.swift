import UIKit

class LoginController : UIViewController {
    //MARK: -Properties
    var presenter : LoginViewPresenterType!
    
    private lazy var scrollView = UIScrollView(frame: view.bounds)
    private lazy var loginButton = UIButton(title: "Login",
                                       titleColor: .black,
                                       backGroundColor: .white)
    private lazy var loginLabel = UILabel(title: "Log in?",
                                     backGroundColor: .white,
                                     cornerRadus: 10)
    
    lazy var emailTextField = CustomTextField(placeholder: "Email")
    lazy var passwordTextField = CustomTextField(placeholder: "Password")
    
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
    
    @objc private func tapOnLogin() {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if !email.isEmpty && !password.isEmpty{
            let user = LoginUser(email: email,
                                 password: password)
            presenter.login(user: user)
        } else {
            self.showToast(message: "Fill all fields", font: .systemFont(ofSize: 24))
        }
    }
}
//MARK: -SetConstraints
private extension LoginController {
    
    func setConstrints() {
        view.backgroundColor = .white
        
        loginButton.addTarget(nil,
                                 action: #selector(tapOnLogin),
                                 for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,
                                                       passwordTextField
                                                       ],
                                    axis: .vertical,
                                    spacing: 40)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(loginLabel)
        scrollView.addSubview(messageLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            loginLabel.widthAnchor.constraint(equalToConstant: 200),
            loginLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 6),
            messageLabel.widthAnchor.constraint(equalToConstant: 300),
            messageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 260),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setTextField() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
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
    }
}
//MARK: -Presenter's delegate
extension LoginController : LoginViewType {
    
    func sucess() {
        presenter.moveOnMain()
    }
    func failure(error: Error) {
        self.showToast(message: error.localizedDescription, font: .systemFont(ofSize: 24))
    }
    
}

