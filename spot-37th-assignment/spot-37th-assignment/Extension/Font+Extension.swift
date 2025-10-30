//
//  Font+Extension.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 10/30/25.
//

import Foundation
import UIKit
enum PretendardWeight: String {
    case black = "Black"
    case bold = "Bold"
    case extraBold = "ExtraBold"
    case extraLight = "ExtraLight"
    case light = "Light"
    case medium = "Medium"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case thin = "Thin"
}

extension UIFont {
    
    static let head_b_24: UIFont = UIFont(name: PretendardWeight.bold.rawValue, size: 24) ?? UIFont()
    static let head_b_18: UIFont = UIFont(name: PretendardWeight.bold.rawValue, size: 18) ?? UIFont()
    static let title_sb_18: UIFont = UIFont(name: PretendardWeight.semiBold.rawValue, size: 18) ?? UIFont()
    static let body_r_14: UIFont = UIFont(name: PretendardWeight.regular.rawValue, size: 14) ?? UIFont()
    static let caption_r_10: UIFont = UIFont(name: PretendardWeight.regular.rawValue, size: 10) ?? UIFont()
    
}
