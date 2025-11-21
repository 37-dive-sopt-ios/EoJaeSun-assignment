//
//  LoginViewController.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 10/30/25.
//

import UIKit
import Then
import SnapKit

final class LoginViewController: BaseViewController {
    
    
    let provider = NetworkProvider()
    
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var loginButton = UIButton()
    private lazy var selectAccountButton = UIButton()
    private lazy var toRegisterViewButton = UIButton()
    private lazy var clearButton = UIButton()
    private lazy var toggleButton = UIButton()
    private let rightButtonView = UIStackView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setStyle()
        setHierarchy()
        setLayout()
        
    }
}

extension LoginViewController {
    func setStyle() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "이메일 또는 아이디로 계속"
        self.emailTextField.do {
            $0.delegate = self
            $0.placeholder = "이메일 아이디"
            $0.font = .body_r_14
            $0.layer.cornerRadius = 4
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.baeminGray200.cgColor
            $0.addLeftPadding(10)
            $0.setPlaceholder(color: .baeminGray700)
            $0.tintColor = .baeminMint300
            $0.clearButtonMode = .whileEditing
        }
        
        self.passwordTextField.do {
            
            $0.delegate = self
            $0.placeholder = "비밀번호"
            $0.font = .body_r_14
            $0.layer.cornerRadius = 4
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.baeminGray200.cgColor
            $0.addLeftPadding(10)
            $0.setPlaceholder(color: .baeminGray700)
            $0.isSecureTextEntry = true
            $0.tintColor = .baeminMint300
            $0.rightView = rightButtonView
            $0.rightViewMode = .whileEditing
        }
        
        self.loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.baeminWhite, for: .normal)
            $0.backgroundColor = .baeminGray200
            $0.titleLabel?.font = .head_b_18
            $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
            $0.layer.cornerRadius = 4
            $0.isEnabled = false
        }
        
        
        self.selectAccountButton.do {
            $0.setTitle("계정 찾기", for: .normal)
            $0.setTitleColor(.baeminBlack, for: .normal)
            $0.setImage(UIImage(named: "baemin-ChevronRight"), for: .normal)
            $0.titleLabel?.font = .body_r_14
            $0.semanticContentAttribute = .forceRightToLeft
        }
        
        toRegisterViewButton.do {
            $0.setTitle("회원 가입", for: .normal)
            $0.setTitleColor(.baeminBlack, for: .normal)
            $0.setImage(UIImage(named: "baemin-ChevronRight"), for: .normal)
            $0.addTarget(self, action: #selector(showRegisterView), for: .touchUpInside)
            $0.titleLabel?.font = .body_r_14
            $0.semanticContentAttribute = .forceRightToLeft
        }
        
        self.rightButtonView.do {
            $0.axis = .horizontal
            $0.spacing = 16
            $0.alignment = .center
            $0.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            $0.isLayoutMarginsRelativeArrangement = true
            
        }
        self.clearButton.do {
            $0.setImage(UIImage(named: "baemin-x-circle-fill"), for: .normal)
            $0.tintColor = .baeminGray300
            $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
            $0.isHidden = true
            
        }
        
        self.toggleButton.do {
            $0.setImage(UIImage(named: "baemin-eye-slash"), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            
        }
        
    }
    
    func setHierarchy() {
        
        rightButtonView.addArrangedSubview(clearButton)
        rightButtonView.addArrangedSubview(toggleButton)
        
        [emailTextField,passwordTextField,loginButton, selectAccountButton,selectAccountButton,toRegisterViewButton].forEach {
            self.view.addSubview($0)
        }
        
    }
    
    func setLayout() {
        
        
        self.emailTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(101)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(46)
        }
        
        self.passwordTextField.snp.makeConstraints {
            $0.top.equalTo(self.emailTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(46)
        }
        
        self.loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(46)
        }
        self.selectAccountButton.snp.makeConstraints {
            $0.top.equalTo(self.loginButton.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(66)
            $0.height.equalTo(14)
        }
        self.toRegisterViewButton.snp.makeConstraints {
            $0.top.equalTo(self.selectAccountButton.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(66)
            $0.height.equalTo(14)
        }
        
        
        
        
    }
    
    
    
    /// 로그인 API 호출
    @MainActor
    private func performLogin(username: String, password: String) async {
        loadingIndicator.startAnimating()
        
        do {
            // UserAPI의 convenience method 사용
            let response = try await UserAPI.performLogin(
                username: username,
                password: password,
                provider: provider
            )
            
            // 성공 시 Welcome 화면으로 이동
            showAlert(title: "로그인 성공", message: response.message) { [weak self] in
                self?.navigateToWelcome(userId: response.userId, userName: username)
            }
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Login Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Login Unknown Error] \(error)")
            showAlert(title: "로그인 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
    
    
    @objc func loginButtonDidTap() {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        
        
// 잠시 해제!
//        if isValidEmail(email: emailText) {
            if !emailText.isEmpty && !passwordText.isEmpty {
                Task{
                    await performLogin(username: emailText, password: passwordText)
                }
            }
//        } else {
//            let alert = UIAlertController(title: "알림", message: "이메일 형식이 달라요", preferredStyle: .alert)
//            
//            let okAction = UIAlertAction(title: "확인", style: .default)
//            alert.addAction(okAction)
//            
//            present(alert, animated: true, completion: nil)
//        }
    }
    
    @objc func showRegisterView() {
        let registerView = RegisterViewController()
        if let vc = navigationController?.sheetPresentationController {
            vc.detents = [.medium(), .large()]
        }
        present(registerView, animated: true)
    }
    
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private func navigateToWelcome(userId: Int, userName: String) {
        let welcomeVC = WelcomeViewController()
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
        textField.layer.borderWidth = 1
        
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        
        if !emailText.isEmpty && !passwordText.isEmpty {
            loginButton.backgroundColor = .baeminMint500
            loginButton.isEnabled = true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersInRanges ranges: [NSValue], replacementString string: String) -> Bool {
        
        
        if let passwordText = passwordTextField.text {
            if passwordText.isEmpty {
                clearButton.isHidden = true
            } else {
                clearButton.isHidden = false
            }
        }
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.baeminBlack.cgColor
        textField.layer.borderWidth = 2
        
        if let passwordText = passwordTextField.text {
            if passwordText.isEmpty {
                clearButton.isHidden = true
            } else {
                clearButton.isHidden = false
            }
        }
        
        clearButton.addTarget(self, action: #selector(clearButtonAction), for: .touchUpInside)
        toggleButton.addTarget(self, action: #selector(toggleButtonAction), for: .touchUpInside)
    }
    
    @objc func clearButtonAction() {
        passwordTextField.text =  ""
        passwordTextField.becomeFirstResponder()
    }
    
    @objc func toggleButtonAction() {
        passwordTextField.isSecureTextEntry.toggle()
        toggleButton.setImage(UIImage(named: passwordTextField.isSecureTextEntry ? "baemin-eye-slash" : "baemin-eye"), for: .normal)
        passwordTextField.becomeFirstResponder()
    }
}

#Preview {
    LoginViewController()
}
