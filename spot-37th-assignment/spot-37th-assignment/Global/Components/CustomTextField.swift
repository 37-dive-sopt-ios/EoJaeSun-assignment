//
//  CustomTextFeild.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/21/25.
//

import UIKit

final class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
    }
    
    func setStyle() {
        font = .body_r_14
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.baeminGray200.cgColor
        addLeftPadding(10)
        setPlaceholder(color: .baeminGray700)
        tintColor = .baeminMint300
        clearButtonMode = .whileEditing
    }
}
