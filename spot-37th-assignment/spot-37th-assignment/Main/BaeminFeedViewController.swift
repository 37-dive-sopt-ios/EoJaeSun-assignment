//
//  BaeminViewController.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/13/25.
//

import UIKit

import SnapKit

enum BaeminFeedSection: Int, CaseIterable {
    case navigation = 0
    case searchBar
    case banner
    case category
    case brand
}


final class BaeminFeedViewController: BaseViewController {
    
    private let rootView = BaeminFeedView()
    
    private var baemincategory:[BaeminCategoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        loadMockData()
    }
    
    override func setView() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        self.view.addSubview(rootView)
        
        rootView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
            
        }
    }
    
    private func loadMockData() {
        baemincategory = BaeminCategoryModel.mockData
        rootView.baeminFeedCollectionView.reloadData()
    }
    override func setDelegate() {
        rootView.baeminFeedCollectionView.delegate = self
        rootView.baeminFeedCollectionView.dataSource = self
    }
    private func register() {
        
        rootView.baeminFeedCollectionView.register(BaeminFeedNavigationbarCell.self, forCellWithReuseIdentifier: BaeminFeedNavigationbarCell.identifier)
        
        rootView.baeminFeedCollectionView.register(BaeminFeedBannerCell.self, forCellWithReuseIdentifier: BaeminFeedBannerCell.identifier)
        
        
        rootView.baeminFeedCollectionView.register(BaeminSearchBarCell.self, forCellWithReuseIdentifier: BaeminSearchBarCell.identifier)
        
        rootView.baeminFeedCollectionView.register(BaeminCategoryHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BaeminCategoryHeaderView.identifier)
        
        rootView.baeminFeedCollectionView.register(BaeminCategoryCollectionViewCell.self, forCellWithReuseIdentifier: BaeminCategoryCollectionViewCell.identifier)
        
        rootView.baeminFeedCollectionView.register(BaeminCategoryFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BaeminCategoryFooterView.identifier)
        
    }
    override func setAddTarget() {
        
    }
    
    
}


extension BaeminFeedViewController: UICollectionViewDelegate {
    
}

extension BaeminFeedViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        BaeminFeedSection.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = BaeminFeedSection(rawValue: section) else {
            return 0
        }
        
        switch sectionType {
            
        case .navigation, .banner, .searchBar:
            return 1
            
        case .category:
            return baemincategory.count
        case .brand:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionType = BaeminFeedSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch sectionType {
            
        case .navigation:
            return rootView.baeminFeedCollectionView.dequeueReusableCell(withReuseIdentifier: BaeminFeedNavigationbarCell.identifier, for: indexPath)
            
        case .searchBar:
            return rootView.baeminFeedCollectionView.dequeueReusableCell(withReuseIdentifier: BaeminSearchBarCell.identifier, for: indexPath)
        case .banner:
            return rootView.baeminFeedCollectionView.dequeueReusableCell(withReuseIdentifier: BaeminFeedBannerCell.identifier, for: indexPath)
        case .category:
            guard let cell = rootView.baeminFeedCollectionView.dequeueReusableCell(withReuseIdentifier: BaeminCategoryCollectionViewCell.identifier, for: indexPath) as? BaeminCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(title: baemincategory[indexPath.item].title, image: nil)
            return cell
            
        case .brand:
            return UICollectionViewCell()
            
            
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if indexPath.section == 3 {
                guard let tabBar = rootView.baeminFeedCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BaeminCategoryHeaderView.identifier, for: indexPath) as? BaeminCategoryHeaderView else {
                    return UICollectionReusableView()
                }
                return tabBar
            }
        }
        if kind == UICollectionView.elementKindSectionFooter {
            if indexPath.section == 3 {
                guard let footer = rootView.baeminFeedCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BaeminCategoryFooterView.identifier, for: indexPath) as? BaeminCategoryFooterView else {
                    return UICollectionReusableView()
                }
                return footer
            }
        }
        
        
        return UICollectionReusableView()
    }
  
}

extension BaeminFeedViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let sectionType = BaeminFeedSection(rawValue: indexPath.section) else {
            return CGSize(.init(width: 0, height: 0))
        }
        let width = rootView.baeminFeedCollectionView.bounds.width
        switch sectionType {
            
        case .navigation:
            return CGSize(width: width, height: 24)
        case .searchBar:
            return CGSize(width: width, height: 40)
        case .banner:
            return CGSize(width: width, height: 38)
        case .category:
            let spacing: CGFloat = 16 * 2
            let itemWidth = (width - spacing) / 5
            return CGSize(width: itemWidth, height: 106)
        case .brand:
            return CGSize(width: 0, height: 0)
        
        }
    }
    
    // Hearder 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 3{
            let width = rootView.baeminFeedCollectionView.bounds.width
            return CGSize(width: width, height: 48)
        }
        
        return .zero
    }
    
    // footer 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 3{
            let width = rootView.baeminFeedCollectionView.bounds.width
            return CGSize(width: width, height: 54)
        }
        return .zero
    }
    
    func collectionView(
           _ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           insetForSectionAt section: Int
       ) -> UIEdgeInsets {
           guard let sectionType = BaeminFeedSection(rawValue: section) else {
               return .zero
           }
           
           switch sectionType {
           case .navigation:
               return .zero
           case .searchBar:
               return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
           case .banner:
               return UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
           case .category:
               return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
           case .brand:
               return .zero
           }
       }
}
