//
//  TargetType.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 11/8/25.
//


import Foundation

/// HTTP Task를 정의하는 enum (Moya의 Task와 동일!)
public enum HTTPTask {
    /// 요청만 보냄 (바디 없음)
    case requestPlain

    /// JSON 인코딩된 파라미터를 바디에 포함
    case requestJSONEncodable(Encodable)

    /// 파라미터와 URL 인코딩 방식 지정
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

/// 파라미터 인코딩 방식 (Moya와 유사)
/// 실제 라이브러리를 뜯어보면 유사하게 되어있습니다.
public enum ParameterEncoding {
    case url
    case json
}

/// The protocol used to define the specifications necessary for a `MoyaProvider`.
/// (Moya의 TargetType과 완전히 동일!)
 protocol TargetType {
    /// The target's base `URL`.
    /// (교육용으로 String 사용, 실제 Moya는 URL 타입)
    var baseURL: String { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: HTTPMethod { get }

    /// The type of HTTP task to be performed.
    var task: HTTPTask { get }

    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}

// MARK: - Default Implementation

extension TargetType {
    /// 기본 헤더 (Moya의 default implementation과 동일)
    var headers: [String: String]? {
        return nil
    }

    /// URLRequest 생성 (Task 기반으로 처리)
    func toURLRequest() throws -> URLRequest {
        // URL 생성
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        // 헤더 추가
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }

        // HTTPTask에 따라 바디 처리 (Moya와 동일한 방식!)
        switch task {
        case .requestPlain:
            // 바디 없음 
            break

        case .requestJSONEncodable(let encodable):
            // JSON 인코딩
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            do {
                // Encodable을 JSON으로 인코딩하기 위한 헬퍼
                let encoder = JSONEncoder()
                request.httpBody = try encodable.encode(with: encoder)
            } catch {
                throw NetworkError.encodingFailed
            }

        case .requestParameters(let parameters, let encoding):
            // 파라미터 인코딩
            switch encoding {
            case .json:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)

            case .url:
                // URL 인코딩 (쿼리 파라미터)
                if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                    urlComponents.queryItems = parameters.map {
                        URLQueryItem(name: $0.key, value: "\($0.value)")
                    }
                    if let newURL = urlComponents.url {
                        request.url = newURL
                    }
                }
            }
        }

        return request
    }
}

// MARK: - Encodable Helper

extension Encodable {
    /// Encodable을 Data로 인코딩하는 헬퍼 메서드
    fileprivate func encode(with encoder: JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
}
