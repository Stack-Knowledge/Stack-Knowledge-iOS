//
//  CustomDialogPurchaseViewController.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/26.
//

import UIKit

class CustomDialogPurchaseViewController: BaseVC {
    
    var okButtonAction: (() -> Void)?
    
    let dialogView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    private let dialogMessageLabel = UILabel().then {
        $0.text = "해당 상품을 구매하시겠습니까?"
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.textColor = .black
    }
    
    private let closeButton = UIButton().then {
        $0.setTitle("취소", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.backgroundColor = UIColor(red: 255, green: 169, blue: 39)
        $0.layer.cornerRadius = 10
    }
    
    private let okButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor(red: 255, green: 169, blue: 39), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor(red: 255, green: 169, blue: 39).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 10
    }
    
    override func addView() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.addSubview(dialogView)
        view.addSubview(dialogMessageLabel)
        view.addSubview(closeButton)
        view.addSubview(okButton)
    }
    
    override func setLayout() {
        dialogView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(280)
            $0.height.equalTo(150)
        }
        
        dialogMessageLabel.snp.makeConstraints {
            $0.top.equalTo(dialogView.snp.top).offset(44)
            $0.leading.trailing.equalToSuperview().inset(58)
        }
        
        closeButton.snp.makeConstraints {
            $0.bottom.equalTo(dialogView.snp.bottom).inset(13)
            $0.leading.equalTo(dialogView.snp.leading).inset(16)
            $0.trailing.equalTo(dialogView.snp.trailing).inset(148)
        }
        
        okButton.snp.makeConstraints {
            $0.bottom.equalTo(dialogView.snp.bottom).inset(13)
            $0.leading.equalTo(dialogView.snp.leading).inset(148)
            $0.trailing.equalTo(dialogView.snp.trailing).inset(16)
        }
    }
    
    override func addTarget() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 1.0
        }
    }
    
    @objc func closeButtonTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 0.0
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @objc func okButtonTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 0.0
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
            self.okButtonAction?()
        }
    }
}
