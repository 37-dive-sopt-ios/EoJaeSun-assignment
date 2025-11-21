//
//  RegisterViewController.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/21/25.
//

import UIKit

import SnapKit

final class RegisterViewController: BaseViewController, RegisterViewDelegate {
    
    
 
    private let registerView = RegisterView()
    let provider = NetworkProvider()
    
    override func setView() {
        self.registerView.delegate = self
        
        view.addSubview(registerView)
    
        registerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func setDelegate() {

    }
    
    
    override func setAddTarget() {
        
    }
    
    func didTapRegisterButton(username: String, password: String, name: String, age: Int, email: String) {
        Task {
            await performRegister(username: username, password: password, name: name, email: email, age: age)
        }
    }
    
    /// 회원가입 API 호출
    @MainActor
    private func performRegister(
        username: String,
        password: String,
        name: String,
        email: String,
        age: Int
    ) async {
        loadingIndicator.startAnimating()
        
        do {
            // UserAPI의 convenience method 사용
            let response = try await UserAPI.performRegister(
                username: username,
                password: password,
                name: name,
                email: email,
                age: age,
                provider: provider
            )
            
            // 성공 시 Welcome 화면으로 이동
            showAlert(title: "회원가입 성공", message: "회원가입이 완료되었습니다!") { [weak self] in
                self?.dismiss(animated: true)
            }
        } catch let error as NetworkError {
            // 콘솔에 상세 에러 로그 출력
            print("🚨 [Register Error] \(error.detailedDescription)")
            // 사용자에게는 친절한 메시지 표시
            showAlert(title: "회원가입 실패", message: error.localizedDescription)
        } catch {
            print("🚨 [Register Unknown Error] \(error)")
            showAlert(title: "회원가입 실패", message: error.localizedDescription)
        }
        
        loadingIndicator.stopAnimating()
    }
}
