//
//  MainView.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/13/25.
//

import UIKit

import SnapKit
import Then

class MainView: BaseView {

    private let gradientBackgroundView = UIView()
    let gradientLayer = CAGradientLayer()
    
    
    private let navgationBar = MainNavigationbarView()
    private let serachbar = CustomSearchView()
    
    
    override func setUI() {
        addSubview(gradientBackgroundView)
        
        [navgationBar,serachbar].forEach {
            addSubview($0)
            
        }
       
        
        
    }
    
    override func setStyle() {
        gradientLayer.colors = [
            UIColor.baeminWhite.cgColor,
            UIColor.baeminMint300.cgColor
        ]
        gradientBackgroundView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func setLayout() {
        
        
        navgationBar.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview().inset(16)
        }
        serachbar.snp.makeConstraints {
            $0.top.equalTo(navgationBar.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        gradientBackgroundView.snp.makeConstraints {
            $0.top.equalTo(serachbar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = gradientBackgroundView.bounds
    }
}
