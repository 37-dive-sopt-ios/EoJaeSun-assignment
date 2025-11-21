//
//  LoadingIndicatorable.swift
//  sopt-37th-01Seminar
//
//  Created by 어재선 on 11/8/25.
//

import Foundation

import UIKit

/// Loading Indicator를 표시할 수 있는 기능을 정의하는 프로토콜
protocol LoadingIndicatorable: AnyObject {
    var loadingIndicator: UIActivityIndicatorView { get }
}

// MARK: - Default Implementation (기본 구현)

extension LoadingIndicatorable where Self: UIViewController {
    /// Loading Indicator 시작
    func startLoading() {
        loadingIndicator.startAnimating()
    }
    
    /// Loading Indicator 종료
    func stopLoading() {
        loadingIndicator.stopAnimating()
    }
}
