//
//  BaeminCategoryCollectionViewCell.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/14/25.
//

import UIKit

import SnapKit
import Then

class BaeminCategoryCollectionViewCell: BaseCollectionViewCell {
    
    static let identifier: String = "BaeminCategoryCollectionViewCell"
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    
    private let categroyView = UIStackView()
    
    
    override func setUI() {
        addSubview(categroyView)
        
    }
    override func setStyle() {
        
        titleLabel.do {
            $0.text = "타이틀"
            $0.font = .body_r_14
            $0.textColor = .baeminBlack
        }
        
        imageView.do {
            $0.image = UIImage(named: "sampleImage")
            $0.backgroundColor = .baeminWhite
            $0.frame = CGRect(x: 0, y: 0, width: 54, height: 54)
        }
        
        categroyView.do {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .center
            $0.addArrangedSubview(titleLabel)
            $0.addArrangedSubview(imageView)
            
        }
        
    }
    override func setLayout() {
        categroyView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(title: String, image: UIImage?) {
        titleLabel.text = title
        imageView.image = image
        
    }
}
