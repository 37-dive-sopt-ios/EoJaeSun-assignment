//
//  RegisterView.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/21/25.
//

import UIKit

import SnapKit
import Then

protocol RegisterViewDelegate: AnyObject {
    func didTapRegisterButton(username: String, password: String, name: String, age: Int, email: String)
}

final class RegisterView: BaseView {
    
    weak var delegate : RegisterViewDelegate?
    
    private let usernameTextField = CustomTextField()
    private let passwordTextField = CustomTextField()
    private let nameTextField = CustomTextField()
    private let emailTextField = CustomTextField()
    private let ageTextField = CustomTextField()
    private lazy var registerButton = UIButton()
    override func setUI() {
        [usernameTextField, passwordTextField, nameTextField, emailTextField, ageTextField, registerButton].forEach {
            addSubview($0)
        }
    }
    
    override func setStyle() {
        usernameTextField.do {
            $0.placeholder = "Username (예: johndoe)"
            $0.borderStyle = .roundedRect
            $0.autocapitalizationType = .none
        }
        
        passwordTextField.do {
            $0.placeholder = "Password (예: P@ssw0rd!)"
            $0.borderStyle = .roundedRect
            $0.isSecureTextEntry = true
        }
        
        nameTextField.do {
            $0.placeholder = "이름 (예: 홍길동)"
            $0.borderStyle = .roundedRect
        }
        emailTextField.do {
            $0.placeholder = "Email (예: hong@example.com)"
            $0.borderStyle = .roundedRect
            $0.keyboardType = .emailAddress
            $0.autocapitalizationType = .none
        }
        
        ageTextField.do {
            $0.placeholder = "나이 (예: 25)"
            $0.borderStyle = .roundedRect
            $0.keyboardType = .numberPad
        }
        
        registerButton.do {
            $0.setTitle("회원가입", for: .normal)
            $0.setTitleColor(.baeminWhite, for: .normal)
            $0.backgroundColor = .baeminMint500
            $0.titleLabel?.font = .head_b_18
            $0.layer.cornerRadius = 4
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
        
    }
    
    override func setLayout() {
    
        
        usernameTextField.snp.makeConstraints {
            $0.top.equalTo(safeAreaInsets.bottom).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
    }
    
    @objc func didTapButton() {
        
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let name = nameTextField.text, !name.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let ageText = ageTextField.text, let age = Int(ageText) else {
            return
        }
        delegate?.didTapRegisterButton(username: username, password: password, name: name, age: age, email: email)
    }
    
}


#Preview {
    RegisterView()
}
