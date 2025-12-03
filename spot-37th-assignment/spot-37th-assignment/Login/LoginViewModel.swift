//
//  LoginViewModel.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 12/3/25.
//

import Foundation
import Combine

final class LoginViewModel {
    
    struct Input {
        let emailText: AnyPublisher<String,Never>
        let passwordText: AnyPublisher<String,Never>
    }
    
    struct Output {
        let isLoginButtonEnabled: AnyPublisher<Bool,Never>
    }
    
    func transform(input: Input) -> Output {
        
        let credentials = Publishers.CombineLatest(
               input.emailText,
               input.passwordText
           )
        
        let isLoginButtonEnabled = credentials
               .map { email, password in
                   let result = !email.isEmpty && !password.isEmpty
                   return result
               }
               .eraseToAnyPublisher()
        
        return Output(isLoginButtonEnabled: isLoginButtonEnabled)
    }
    
}
