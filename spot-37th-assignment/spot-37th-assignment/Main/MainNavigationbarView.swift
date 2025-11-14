//
//  MainNavigationbarView.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/14/25.
//

import UIKit

import Then
import SnapKit

final class MainNavigationbarView: BaseView {
    
    private let locationTextLabel = UILabel()
    private let locationImageView = UIImageView()
    private lazy var discountButton = UIButton()
    private lazy var notificationButton = UIButton()
    private lazy var shoppingCartButton = UIButton()
    
    private let locationStackView = UIStackView()
    private let rightButtonsStackView = UIStackView()
    
    override func setStyle() {
        
        locationStyle()
        rightButtonsStyle()
        
    }
    
    override func setUI() {
        
        [locationStackView, rightButtonsStackView].forEach {
            addSubview($0)
        }
    }
    
    override func setLayout() {
        
        locationStackView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
        }
        
        rightButtonsStackView.snp.makeConstraints{
            $0.trailing.top.bottom.equalToSuperview()
        }
    }
    
    
    private func rightButtonsStyle() {
        discountButton.do {
            $0.setImage(UIImage(named: "baemin-DiscountIcon"), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        }
        notificationButton.do {
            $0.setImage(UIImage(named: "baemin-NotificationIcon"), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        }
        shoppingCartButton.do {
            $0.setImage(UIImage(named: "baemin-ShoppingcartIcon"), for: .normal)
            $0.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        }
        
        rightButtonsStackView.do {
            $0.axis = .horizontal
            $0.spacing = 12
            $0.alignment = .center
            $0.isLayoutMarginsRelativeArrangement = true
            $0.addArrangedSubview(discountButton)
            $0.addArrangedSubview(notificationButton)
            $0.addArrangedSubview(shoppingCartButton)
            
            
        }
    }
    
    // MARK: - LocationStyle
    private func locationStyle() {
        
        locationTextLabel.do {
            $0.text = "우리집"
            $0.font = .head_b_16
        }
        locationImageView.do {
            $0.image = UIImage(named: "baemin-DowntriangleIcon")
        }
        
        locationStackView.do {
            $0.axis = .horizontal
            $0.spacing = 3
            $0.alignment = .center
            $0.isLayoutMarginsRelativeArrangement = true
            $0.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
            $0.addArrangedSubview(locationTextLabel)
            $0.addArrangedSubview(locationImageView)
            
        }
    }
    
}
