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

    private let navgationBar = MainNavigationbarView()
    private let serachbar = CustomSearchView()
    
    override func setUI() {
        [navgationBar,serachbar].forEach {
            addSubview($0)
        }
        
        
    }
    
    override func setStyle() {
        
    }
    override func setLayout() {
        navgationBar.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview().inset(16)
        }
        serachbar.snp.makeConstraints {
            $0.top.equalTo(navgationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        
    }
}
