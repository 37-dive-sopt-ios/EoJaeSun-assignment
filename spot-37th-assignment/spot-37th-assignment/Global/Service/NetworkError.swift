//
//  NetworkError.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 11/8/25.
//

import Foundation

/// 네트워크 에러 타입
enum NetworkError: Error {
    case invalidURL          // NetworkProvider에서 URL 생성 실패 시 throw
    case invalidResponse     // NetworkProvider에서 HTTPURLResponse 변환 실패 시 throw
    case noData              // UserAPI convenience methods에서 response.data가 nil일 때 throw
    case decodingFailed      // NetworkProvider에서 JSON 디코딩 실패 시 throw
    case encodingFailed      // NetworkProvider에서 Request body 인코딩 실패 시 throw
    case serverError(statusCode: Int, message: String?)  // NetworkProvider에서 400~599 에러 발생 시 throw
    case unknown(Error)      // NetworkProvider에서 URLSession 에러 catch 시 throw

    /// 사용자에게 보여줄 에러 메시지 (ViewController의 Alert에서 사용)
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "잘못된 URL입니다."
        case .invalidResponse:
            return "올바르지 않은 응답입니다."
        case .noData:
            return "데이터가 없습니다."
        case .decodingFailed:
            return "데이터 디코딩에 실패했습니다.\n서버 응답 형식을 확인해주세요."
        case .encodingFailed:
            return "데이터 인코딩에 실패했습니다.\n요청 데이터를 확인해주세요."
        case .serverError(let statusCode, let message):
            return serverErrorMessage(statusCode: statusCode, message: message)
        case .unknown(let error):
            if let urlError = error as? URLError {
                return urlErrorMessage(urlError)
            }
            return "알 수 없는 에러가 발생했습니다.\n\(error.localizedDescription)"
        }
    }

    /// 상세 에러 정보 (디버깅/로깅용 - print()나 Logger에서 사용)
    var detailedDescription: String {
        switch self {
        case .invalidURL:
            return "[NetworkError.invalidURL] 요청 URL을 생성할 수 없습니다. baseURL과 path를 확인하세요."
        case .invalidResponse:
            return "[NetworkError.invalidResponse] 서버 응답을 HTTPURLResponse로 변환할 수 없습니다."
        case .noData:
            return "[NetworkError.noData] 서버로부터 데이터를 받지 못했습니다."
        case .decodingFailed:
            return "[NetworkError.decodingFailed] JSON 디코딩 실패. Response 모델과 실제 응답 구조가 일치하는지 확인하세요."
        case .encodingFailed:
            return "[NetworkError.encodingFailed] Request Body 인코딩 실패. Request 모델을 확인하세요."
        case .serverError(let statusCode, let message):
            return "[NetworkError.serverError] Status: \(statusCode), Message: \(message ?? "none")"
        case .unknown(let error):
            return "[NetworkError.unknown] \(error)"
        }
    }

    // MARK: - Private Helpers

    /// HTTP 상태 코드별 에러 메시지 생성 (localizedDescription에서 호출)
    private func serverErrorMessage(statusCode: Int, message: String?) -> String {
        let baseMessage: String
        switch statusCode {
        case 400:
            baseMessage = "잘못된 요청입니다."
        case 401:
            baseMessage = "인증에 실패했습니다."
        case 403:
            baseMessage = "접근 권한이 없습니다."
        case 404:
            baseMessage = "요청한 리소스를 찾을 수 없습니다."
        case 409:
            baseMessage = "리소스 충돌이 발생했습니다."
        case 500...599:
            baseMessage = "서버 오류가 발생했습니다."
        default:
            baseMessage = "서버 에러가 발생했습니다."
        }

        if let message = message {
            return "\(baseMessage)\n(\(statusCode): \(message))"
        } else {
            return "\(baseMessage) (상태 코드: \(statusCode))"
        }
    }

    /// URLError 타입별 에러 메시지 생성 (localizedDescription에서 호출)
    private func urlErrorMessage(_ error: URLError) -> String {
        switch error.code {
        case .notConnectedToInternet:
            return "인터넷 연결이 끊어졌습니다.\n네트워크 연결을 확인해주세요."
        case .timedOut:
            return "요청 시간이 초과되었습니다.\n잠시 후 다시 시도해주세요."
        case .cannotFindHost, .cannotConnectToHost:
            return "서버에 연결할 수 없습니다.\n서버 주소를 확인해주세요."
        case .networkConnectionLost:
            return "네트워크 연결이 끊어졌습니다."
        case .dnsLookupFailed:
            return "DNS 조회에 실패했습니다."
        case .badURL:
            return "잘못된 URL입니다."
        case .cancelled:
            return "요청이 취소되었습니다."
        default:
            return "네트워크 에러가 발생했습니다.\n(\(error.code.rawValue): \(error.localizedDescription))"
        }
    }
}
