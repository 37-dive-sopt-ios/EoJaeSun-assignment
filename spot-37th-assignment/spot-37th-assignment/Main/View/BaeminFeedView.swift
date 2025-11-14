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

    
    
    lazy var baeminFeedCollectionView = UICollectionView( frame: .zero,
                                                          collectionViewLayout: flowLayout)
    private let flowLayout = CustomCollectionViewFlowLayout(stickyIndexPath: IndexPath(item: 0, section: 1))
    
    
        
    override func setUI() {
        
        [baeminFeedCollectionView ].forEach {
            addSubview($0)
            
        }
       
        
        
    }
    
    override func setStyle() {
        
        
        flowLayout.do {
            $0.scrollDirection = .vertical
            $0.minimumInteritemSpacing = 0
            $0.minimumLineSpacing = 0
            $0.sectionHeadersPinToVisibleBounds = true
        }
        baeminFeedCollectionView.backgroundColor = .clear
        
        
    }
    
    override func setLayout() {
        

        
      
        baeminFeedCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
   
}
