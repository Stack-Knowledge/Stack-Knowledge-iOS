//
//  RankingTableViewCell.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/10/15.
//

import UIKit
import SnapKit
import Then

class RankingTableViewCell: UITableViewCell {
    
    let rowLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 20)
    }
    
    let userImageView = UIImageView().then {
        $0.image = UIImage(named: "ProfileImage")
    }
    
    let userNameLabel = UILabel().then {
        $0.text = "안강호"
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    let myMilesLabel = UILabel().then {
        let number = 1000
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: number)) {
            $0.text = formattedNumber
        }
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    let milesLabel = UILabel().then {
        $0.text = "M"
        $0.font = UIFont(name: "Roboto-Medium", size: 12)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(rowLabel)
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(myMilesLabel)
        addSubview(milesLabel)
    }
    
    func setLayout() {
        userImageView.snp.makeConstraints {
            $0.leading.equalTo(safeAreaLayoutGuide).inset(32.42)
            $0.top.equalTo(safeAreaLayoutGuide).inset(12)
            $0.width.equalTo(41.83)
            $0.height.equalTo(40)
        }
        rowLabel.snp.makeConstraints {
            $0.trailing.equalTo(userImageView.snp.leading).inset(-8.37)
            $0.top.equalTo(safeAreaLayoutGuide).inset(18.8)
        }
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(userImageView.snp.trailing).offset(8.37)
            $0.centerY.equalToSuperview()
        }
        myMilesLabel.snp.makeConstraints {
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(42.14)
            $0.centerY.equalToSuperview()
        }
        milesLabel.snp.makeConstraints {
            $0.leading.equalTo(myMilesLabel.snp.trailing).offset(2.09)
            $0.centerY.equalToSuperview()
        }
    }
}
