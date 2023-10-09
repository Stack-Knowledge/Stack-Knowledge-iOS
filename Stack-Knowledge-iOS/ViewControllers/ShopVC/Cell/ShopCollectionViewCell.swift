//
//  ShopCollectionViewCell.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/24.
//

import UIKit
import SnapKit
import Then

class ShopCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    static var selectedCount: Int = 0
    
    private let cellImageView = UIImageView().then {
        $0.backgroundColor = UIColor(red: 217, green: 217, blue: 217)
        $0.layer.cornerRadius = 10
    }
    
    private let checkBoxButton = UIButton().then {
        $0.setImage(UIImage(named: "UnCheckedBox"), for: .normal)
        $0.setImage(UIImage(named: "CheckedBox"), for: .selected)
    }
    
    private let merchandiseNameLabel = UILabel().then {
        $0.text = "외출권"
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let merchandisePriceLabel = UILabel().then {
        $0.text = "1000 원"
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
        addTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        addSubview(cellImageView)
        addSubview(checkBoxButton)
        addSubview(merchandiseNameLabel)
        addSubview(merchandisePriceLabel)
    }
    
    private func setLayout() {
        cellImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(0)
            $0.width.equalTo(164)
            $0.height.equalTo(160)
        }
        checkBoxButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(8)
        }
        merchandiseNameLabel.snp.makeConstraints {
            $0.top.equalTo(cellImageView.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(0)
        }
        merchandisePriceLabel.snp.makeConstraints {
            $0.top.equalTo(merchandiseNameLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(0)
        }
    }
    
    private func addTarget() {
        checkBoxButton.addTarget(self, action: #selector(checkBoxButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func checkBoxButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            ShopCollectionViewCell.selectedCount += 1
        } else {
            ShopCollectionViewCell.selectedCount -= 1
        }
        if let shopVC = findShopVC() {
            shopVC.updateCustomStackKnowledgeButtonVisibility()
        }
    }
    
    private func findShopVC() -> ShopVC? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            if let shopVC = nextResponder as? ShopVC {
                return shopVC
            }
            responder = nextResponder
        }
        return nil
    }
}
