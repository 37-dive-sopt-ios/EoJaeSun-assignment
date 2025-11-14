//
//  MainView.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/13/25.
//

import UIKit

import SnapKit
import Then



class BaeminFeedView: BaseView {

    private let gradientBackgroundView = UIView()
    let gradientLayer = CAGradientLayer()
    
    lazy var baeminFeedCollectionView = UICollectionView( frame: .zero,
                                                          collectionViewLayout: flowLayout)
    private let flowLayout = CustomCollectionViewFlowLayout(stickyIndexPath: IndexPath(item: 0, section: 1))
    
    
        
    override func setUI() {
        
        [gradientBackgroundView, baeminFeedCollectionView ].forEach {
            addSubview($0)
            
        }
       
        
        
    }
    
    override func setStyle() {
        gradientLayer.colors = [
            UIColor.baeminWhite.cgColor,
            UIColor.baeminMint300.cgColor
        ]
        
        gradientBackgroundView.layer.insertSublayer(gradientLayer, at: 0)
        
        flowLayout.do {
            $0.scrollDirection = .vertical
            $0.minimumInteritemSpacing = 0
            $0.minimumLineSpacing = 0
            $0.sectionHeadersPinToVisibleBounds = true
        }
        baeminFeedCollectionView.backgroundColor = .clear
        
        
    }
    
    override func setLayout() {
        

        
        gradientBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        baeminFeedCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = gradientBackgroundView.bounds
    }
}
