//
//  CustomSearchView.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/14/25.
//

import UIKit

import Then
import SnapKit

final class CustomSearchView: BaseView {
    private let searchTextField = UITextField()
    private let searchButton = UIButton()
    private let rightsButtonView = UIStackView()
    
    
    override func setUI() {
        addSubview(searchTextField)
    }
    
    override func setStyle() {
        searchButton.do {
            $0.setImage(UIImage(named: "baemin-SearchIcon"), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        }
        
        searchTextField.do {
            $0.placeholder = "찾아라! 맛있는 음식과 맛집"
            $0.rightView = rightsButtonView
            $0.rightViewMode = .always
            $0.backgroundColor = .baeminWhite
            $0.layer.cornerRadius = 20
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.baeminBlack.cgColor
            $0.addLeftPadding(10)
        }
        
        rightsButtonView.do {
            $0.addArrangedSubview(searchButton)
            $0.axis = .horizontal
            $0.spacing = 16
            $0.alignment = .center
            $0.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            $0.isLayoutMarginsRelativeArrangement = true
            
        }
    }
    
    override func setLayout() {
        searchTextField.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(40)
        }
        
    }
}
