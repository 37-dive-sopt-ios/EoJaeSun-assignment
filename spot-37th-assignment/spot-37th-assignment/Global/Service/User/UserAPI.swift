//
//  UserAPI.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 11/8/25.
//


import Foundation

/// User 관련 API 엔드포인트
/// Moya의 TargetType 과 비슷하게 구현함
enum UserAPI {
    case register(RegisterRequest)           // POST /api/v1/users - 회원가입
    case login(LoginRequest)                 // POST /api/v1/auth/login - 로그인
    case userInfo(id: String)              // GET /api/v1/user{id} - 개인정보 조회
}

extension UserAPI: TargetType {
    
    /// 기본 URL
    var baseURL: String {
        // SOPT 세미나 서버 URL (4주차 임시 개방)
        // TODO: 실제 배포 시에는 xcconfig 파일이나 환경 변수로 관리하세요
        return Environment.baseURL
    }
    
    /// API 경로
    var path: String {
        switch self {
        case .register:
            return "/api/v1/users"
        case .login:
            return "/api/v1/auth/login"
        case .userInfo(let id):
            return"/api/v1/users/\(id)"
        }
    }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        case .login:
            return .post
        case .userInfo(id: let id):
            return .get
        }
    }
    
    /// The type of HTTP task to be performed.
    var task: HTTPTask {
        switch self {
        case .register(let request):
            // JSON 인코딩 가능한 객체를 바디로 전송
            return .requestJSONEncodable(request)
            
        case .login(let request):
            // JSON 인코딩 가능한 객체를 바디로 전송
            return .requestJSONEncodable(request)
        case .userInfo(id: let id):
            return .requestPlain
        }
    }
    
    /// 헤더 (Moya와 동일 - 필요시 오버라이드)
    var headers: [String: String]? {
        // Content-Type은 Task에서 자동 설정되므로 여기서는 nil 반환
        return nil
    }
}

// MARK: - Convenience Methods

extension UserAPI {
    
    static func performUserInfo(
        id: String,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> UserResponse {
        let response: BaseResponse<UserResponse> = try await provider.request(
            UserAPI.userInfo(
                id: id
            )
        )
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
    
    /// 회원가입 API 요청 헬퍼
    static func performRegister(
        username: String,
        password: String,
        name: String,
        email: String,
        age: Int,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> UserResponse {
        let request = RegisterRequest(
            username: username,
            password: password,
            name: name,
            email: email,
            age: age
        )
        // BaseResponse로 감싸진 응답 디코딩
        let response: BaseResponse<UserResponse> = try await provider.request(UserAPI.register(request))
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
    
    /// 로그인 API 요청 헬퍼
    static func performLogin(
        username: String,
        password: String,
        provider: NetworkProviding = NetworkProvider()
    ) async throws -> LoginResponse {
        let request = LoginRequest(username: username, password: password)
        // BaseResponse로 감싸진 응답 디코딩
        let response: BaseResponse<LoginResponse> = try await provider.request(UserAPI.login(request))
        guard let data = response.data else {
            throw NetworkError.noData
        }
        
        return data
    }
}
