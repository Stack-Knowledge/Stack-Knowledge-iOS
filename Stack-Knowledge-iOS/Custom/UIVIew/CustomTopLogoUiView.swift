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
        addView()
        setLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainLogoUiImageView = UIImageView().then {
        $0.image = UIImage(named: "StackKnowledgeLogo")
    }
    
    private let mainLogoLabel = UILabel().then {
        $0.text = "Stack Knowledge"
        $0.font = UIFont(name: "Roboto-Medium", size: 18)
    }
    
    private func addView() {
        addSubview(mainLogoLabel)
        addSubview(mainLogoUiImageView)
    }
    
    private func setLayout() {
        mainLogoUiImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(-UIScreen.main.bounds.height / 11.6)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(16)
            $0.width.height.equalTo(20)
        }
        
        mainLogoLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(-UIScreen.main.bounds.height / 11.6)
            $0.leading.equalTo(self.mainLogoUiImageView.snp.trailing).offset(8)
        }
    }
}
