//
//  BaeminCategoryModel.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/14/25.
//

import UIKit

struct BaeminCategoryModel {
    let title: String
    let image: UIImage?
    
    init(title: String, image: UIImage?) {
        self.title = title
        self.image = image
    }
    
    static let mockData: [BaeminCategoryModel] = [
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil),
        BaeminCategoryModel(title: "한그릇", image: nil)
    ]
}
