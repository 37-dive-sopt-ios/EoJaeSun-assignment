//
//  BaeminCategoryHeaderView.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class BaeminCategoryHeaderView: BaseReusableView {
    
    static let identifier: String = "BaeminCategoryHeaderView"
    
    private let tabs: [String] = ["음식배달", "픽업", "장보기·쇼핑", "선물하기", "혜택모아보기"]
    
    private let scrollview = UIScrollView()
    private let stackview = UIStackView()
    
    private let dividerView = UIView()
    
    override func setUI() {
        tabs.forEach { tab in
            let button = UIButton()
            button.setTitle(tab, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.textColor = .baeminBlack
            button.titleLabel?.font = .title_sb_18
            stackview.addArrangedSubview(button)
        }
        scrollview.addSubview(stackview)
        [scrollview, dividerView].forEach{
            addSubview($0)
        }
        
    }
    
    override func setStyle() {
        
        dividerView.do {
            $0.backgroundColor = .baeminGray200
        }
        
        scrollview.do {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .white
        }
        
        stackview.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.distribution = .fill
            $0.spacing = 12
        }
        
    }
    
    override func setLayout() {
        stackview.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            $0.height.equalTo(scrollview)
        }
        dividerView.snp.makeConstraints {
            $0.top.equalTo(scrollview.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        scrollview.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
        }
    }
}
