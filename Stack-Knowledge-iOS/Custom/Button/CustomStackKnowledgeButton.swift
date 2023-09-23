//
//  CustomStackKnowledgeButton.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/20.
//

import UIKit
import SnapKit
import Then

class CustomStackKnowledgeButton: UIButton {
    
    private let customStackKnowledgeButton = UIButton().then {
        $0.backgroundColor = UIColor(red: 255, green: 169, blue: 39)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    init(description: String) {
        super.init(frame: .zero)
        setTitle(description, for: .normal)
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = 10
        backgroundColor = UIColor(red: 255, green: 169, blue: 39)
        titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 20)
    }
}
