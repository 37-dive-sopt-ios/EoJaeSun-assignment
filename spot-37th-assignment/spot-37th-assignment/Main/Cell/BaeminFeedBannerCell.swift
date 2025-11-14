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
    private let gradientBackgroundView = UIView()
    private let gradientLayer = CAGradientLayer()
    
    
    override func setUI() {
        [gradientBackgroundView,bmartImageView, titleStackView].forEach {
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
        
        gradientLayer.colors = [
            UIColor.baeminWhite.cgColor,
            UIColor.baeminWhite.cgColor,
            UIColor.baeminMint300.cgColor,
        ]
        
        gradientBackgroundView.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    override func setLayout() {
        bmartImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
        }
        titleStackView.snp.makeConstraints {
            $0.top.equalTo(bmartImageView.snp.bottom)
            $0.leading.equalTo(bmartImageView.snp.leading)
        }
        gradientBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
