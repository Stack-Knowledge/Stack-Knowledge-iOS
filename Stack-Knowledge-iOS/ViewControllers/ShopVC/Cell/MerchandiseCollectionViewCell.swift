//
//  MerchandiseCollectionViewCell.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/25.
//

import UIKit
import SnapKit
import Then

class MerchandiseCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    private var merchandiseSelectedCount: Int = 1
    
    private let merchandiseCellView = UIView().then {
        $0.backgroundColor = UIColor(red: 255, green: 215, blue: 155)
        $0.layer.cornerRadius = 10
    }
    
    private let merchandiseNameLabel = UILabel().then {
        $0.text = "외출권"
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    private let merchandisePriceLabel = UILabel().then {
        $0.text = "1000 M"
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    private let merchandiseAdditingUiView = UIView().then {
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .white
    }
    
    private let plusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .black
    }
    
    private let countLabel = UILabel().then {
        $0.text = "1"
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    private let minusButton = UIButton().then {
        $0.setImage(UIImage(systemName: "minus"), for: .normal)
        $0.tintColor = .black
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
        addSubview(merchandiseCellView)
        addSubview(merchandiseNameLabel)
        addSubview(merchandisePriceLabel)
        addSubview(merchandiseAdditingUiView)
        addSubview(plusButton)
        addSubview(countLabel)
        addSubview(minusButton)
    }
    
    private func setLayout() {
        merchandiseCellView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(0)
            $0.width.equalTo(343)
            $0.height.equalTo(61)
        }
        merchandiseNameLabel.snp.makeConstraints {
            $0.top.equalTo(merchandiseCellView.snp.top).offset(10)
            $0.leading.equalToSuperview().inset(17)
        }
        merchandisePriceLabel.snp.makeConstraints {
            $0.top.equalTo(merchandiseNameLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(17)
        }
        merchandiseAdditingUiView.snp.makeConstraints {
            $0.top.equalTo(merchandiseCellView.snp.top).offset(20)
            $0.trailing.equalTo(merchandiseCellView.snp.trailing).inset(20)
            $0.width.equalTo(61)
            $0.height.equalTo(21)
        }
        plusButton.snp.makeConstraints {
            $0.top.equalTo(merchandiseAdditingUiView.snp.top).offset(5)
            $0.leading.equalTo(merchandiseAdditingUiView.snp.leading).inset(8)
            $0.size.equalTo(11)
        }
        countLabel.snp.makeConstraints {
            $0.top.equalTo(merchandiseAdditingUiView.snp.top).offset(2)
            $0.leading.equalTo(merchandiseAdditingUiView.snp.leading).inset(27)
        }
        minusButton.snp.makeConstraints {
            $0.top.equalTo(merchandiseAdditingUiView.snp.top).offset(5)
            $0.trailing.equalTo(merchandiseAdditingUiView.snp.trailing).inset(8)
            $0.size.equalTo(11)
        }
    }
    
    private func addTarget() {
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
    }
    
    @objc private func plusButtonTapped() {
        if merchandiseSelectedCount < 10 {
            merchandiseSelectedCount += 1
        }
        updateCountLabel()
    }
    
    @objc private func minusButtonTapped() {
        if merchandiseSelectedCount > 1 {
            merchandiseSelectedCount -= 1
        }
        updateCountLabel()
    }
    
    private func updateCountLabel() {
        countLabel.text = "\(merchandiseSelectedCount)"
    }
}
