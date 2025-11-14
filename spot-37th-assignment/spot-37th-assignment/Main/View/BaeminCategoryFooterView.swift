//
//  BaeminCategoryFooterView.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class BaeminCategoryFooterView: BaseReusableView {
    
    static let identifier: String = "BaeminCategoryFooterView"
    
    private let boldtitleLabel = UILabel()
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let titleStackView = UIStackView()
    private let titleImageStackView = UIStackView()
    private let dividerView = UIView()
    
    override func setUI() {
        addSubview(titleImageStackView)
        addSubview(dividerView)
    }
    override func setStyle() {
        boldtitleLabel.do {
            $0.text = "음식배달"
            $0.font = .haed_b_14
            $0.textColor = .baeminBlack
        }
        
        titleLabel.do {
            $0.text = "에서 더보기"
            $0.font = .body_r_14
            $0.textColor = .baeminBlack
        }
        imageView.do {
            $0.image = UIImage(named: "baemin-ChevronRight")
        }
        
        titleStackView.do {
            $0.axis = .horizontal
            $0.spacing = 0
            $0.alignment = .center
            $0.addArrangedSubview(boldtitleLabel)
            $0.addArrangedSubview(titleLabel)
        }
        
        titleImageStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
            $0.addArrangedSubview(titleStackView)
            $0.addArrangedSubview(imageView)
        }
        
        dividerView.do {
            $0.backgroundColor = .baeminGray200
        }
        
        
        
    }
    override func setLayout() {
        titleImageStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.centerX.centerY.equalToSuperview()
        }
        
        dividerView.snp.makeConstraints{
            $0.bottom.equalTo(titleImageStackView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            
        }
    }
}
