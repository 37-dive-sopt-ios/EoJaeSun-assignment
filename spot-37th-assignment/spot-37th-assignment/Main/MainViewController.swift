//
//  MainViewController.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/13/25.
//

import UIKit

import SnapKit

final class MainViewController: BaseViewController {

    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setView() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
            
        }
        
    }
    
    

}
