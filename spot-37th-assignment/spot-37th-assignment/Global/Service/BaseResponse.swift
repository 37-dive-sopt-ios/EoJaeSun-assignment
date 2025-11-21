//
//  BaseResponse.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 11/8/25.
//

import Foundation


import Foundation

/// 서버 파트장이 준 API 의 공통 응답 형식
/// 보통 BaseResponse 라고 합니다.
public struct BaseResponse<T: Decodable>: Decodable {
    public let success: Bool
    public let code: String?
    public let message: String?
    public let data: T?
}

/// 응답 데이터가 필요 없는 경우가 있을 거란 말이죠? 그걸 위한 Empty 타입입니다.
public struct EmptyResponse: Decodable {
    public init() {}
}
