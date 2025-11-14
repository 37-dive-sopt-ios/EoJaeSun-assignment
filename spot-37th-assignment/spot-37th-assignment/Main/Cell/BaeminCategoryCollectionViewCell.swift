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
    private let categroyView = UIView()
    
    
    override func setUI() {
        
        categroyView.addSubview(imageView)
        [categroyView, titleLabel].forEach{
            addSubview($0)
        }
        
        
    }
    override func setStyle() {
        
        titleLabel.do {
            $0.text = "타이틀"
            $0.font = .body_r_14
            $0.textColor = .baeminBlack
        }
        
        imageView.do {
            $0.contentMode = .scaleAspectFit
            $0.frame = CGRect(x: 0, y: 0, width: 54, height: 54)
        }
        
        categroyView.do {
            $0.layer.cornerRadius = 20
            $0.backgroundColor = .baeminGray200
            $0.clipsToBounds = true
        }
        
    }
    override func setLayout() {
        categroyView.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.height.width.equalTo(54)
        }
        imageView.snp.makeConstraints{
            $0.centerY.centerX.equalToSuperview()
            
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(categroyView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(4)
        }
    }
    
    func configure(title: String, image: UIImage?) {
        titleLabel.text = title
        
    }
}
