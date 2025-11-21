//
//  TabViewController.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/21/25.
//

import UIKit

final class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
        self.tabBar.tintColor = .baeminBlack
        self.tabBar.backgroundColor = .baeminWhite
        
           addVC()
       }
       
       private func addVC() {
           let home = BaeminFeedViewController()
           home.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIcon"))
           
           let shopping = UIViewController()
           shopping.tabBarItem = UITabBarItem(title: "장보기·쇼핑", image: UIImage(named: "shoppingIcon"), selectedImage: UIImage(named: "shoppingIcon"))
           
           let heart = UIViewController()
           heart.tabBarItem = UITabBarItem(title: "찜", image: UIImage(named: "heartIcon"), selectedImage: UIImage(named: "heartIcon"))
           
           let order = UIViewController()
           order.tabBarItem = UITabBarItem(title: "주문내역", image: UIImage(named: "orderIcon"), selectedImage: UIImage(named: "orderIcon"))
           
           let face = UIViewController()
           face.tabBarItem = UITabBarItem(title: "마이배민", image: UIImage(named: "faceIcon"), selectedImage: UIImage(named: "faceIcon"))
           self.viewControllers = [home, shopping, heart, order,face]
       }
}
