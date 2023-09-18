//
//  BaseVC.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/08/25.
//

import UIKit
import SnapKit
import Then

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        addTarget()
        delegate()
        configNavigation()
        setupBackgroundIfNotSet()
    }
    
    private func setupBackgroundIfNotSet() {
        if self.view.backgroundColor == nil {
            self.view.backgroundColor = .white
        }
    }
    
    func addView() {}
    func setLayout() {}
    func addTarget() {}
    func delegate() {}
    func configNavigation() {}
}

