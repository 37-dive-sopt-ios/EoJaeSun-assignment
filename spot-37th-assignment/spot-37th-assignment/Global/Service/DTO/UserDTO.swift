//
//  UserDTO.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 11/8/25.
//

import Foundation

/// 사용자 정보 응답 모델
struct UserResponse: Decodable {
     let id: Int
     let username: String
     let name: String
     let email: String
     let age: Int
     let status: String
}

/// 로그인 요청 모델
struct LoginRequest: Encodable {
     let username: String
     let password: String
}

/// 로그인 응답 모델
struct LoginResponse: Decodable {
     let userId: Int
     let message: String
}

/// 개인정보 수정 요청 모델
struct UpdateUserRequest: Encodable {
     let name: String?
     let email: String?
     let age: Int?
}
