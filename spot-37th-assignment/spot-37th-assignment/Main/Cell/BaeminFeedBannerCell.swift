//
//  BaeminFeedBannerView.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class BaeminFeedBannerCell: BaseCollectionViewCell {
    
    static let identifier: String = "BaeminFeedBannerView"
    
    private let bmartImageView = UIImageView()
    private let titleLabel = UILabel()
    private let titleRigitImageView = UIImageView()
    private let titleStackView = UIStackView()
    
    
    
    override func setUI() {
        [bmartImageView, titleStackView].forEach {
            addSubview($0)
        }
        
    }
    
    override func setStyle() {
        bmartImageView.do {
            $0.image = UIImage(named: "beamin-Bmart")
        }
        
        titleRigitImageView.do {
            $0.image = UIImage(named: "beamin-ChevronRight")
        }
        
        titleLabel.do {
            $0.text = "전상품 쿠폰팩 + 60%특가"
            $0.font = .head_b_16
        }
        
        titleStackView.do {
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 2
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(titleRigitImageView)
        }
        
    }
    
    override func setLayout() {
        bmartImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(bmartImageView.snp.bottom)
            $0.leading.equalTo(bmartImageView.snp.leading)
        }
    }
    
}
