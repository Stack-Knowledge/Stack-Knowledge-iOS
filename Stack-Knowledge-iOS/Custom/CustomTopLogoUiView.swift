//
//  CustomLogoUIView.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/10.
//

import UIKit
import SnapKit

class CustomTopLogoUiView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setLayout()
    }
    
    private let mainLogoUiImageView = UIImageView().then {
        $0.image = UIImage(named: "StackKnowledgeLogo")
    }
    
    private let mainLogoLabel = UILabel().then {
        $0.text = "Stack Knowledge"
        $0.font = UIFont(name: "Roboto-Bold", size: 18)
    }
    
    private func commonInit() {
        addSubview(mainLogoLabel)
        addSubview(mainLogoUiImageView)
    }
    
    private func setLayout() {
        mainLogoUiImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(9)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(16)
            $0.width.height.equalTo(20)
        }
        
        mainLogoLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.leading.equalTo(self.mainLogoUiImageView.snp.trailing).offset(8)
        }
    }
}
