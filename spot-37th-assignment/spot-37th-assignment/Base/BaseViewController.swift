//
//  BaseViewController.swift
//  spot-37th-assignment
//
//  Created by 어재선 on 11/13/25.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad 호출 - \(type(of: self))")

        setView()
        setAddTarget()
        setDelegate()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear 호출 - \(type(of: self))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear 호출 - \(type(of: self))")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear 호출 - \(type(of: self))")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear 호출 - \(type(of: self))")
    }

    func setView() {}
    
    func setAddTarget() {}

    func setDelegate() {}
}
