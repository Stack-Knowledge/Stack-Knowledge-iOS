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
            $0.leading.equalTo(safeAreaLayoutGuide).inset(UIScreen.main.bounds.width / 12)
            $0.top.equalTo(safeAreaLayoutGuide).inset(UIScreen.main.bounds.height / 70)
            $0.width.equalTo(UIScreen.main.bounds.width / 9.3)
            $0.height.equalTo(UIScreen.main.bounds.height / 21.1)
        }
        rowLabel.snp.makeConstraints {
            $0.trailing.equalTo(userImageView.snp.leading).inset(-(UIScreen.main.bounds.width / 46.6))
            $0.top.equalTo(safeAreaLayoutGuide).inset(UIScreen.main.bounds.height / 44.9)
        }
        userNameLabel.snp.makeConstraints {
            $0.leading.equalTo(userImageView.snp.trailing).offset(UIScreen.main.bounds.width / 46.6)
            $0.centerY.equalToSuperview()
        }
        myMilesLabel.snp.makeConstraints {
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(UIScreen.main.bounds.width / 9.25)
            $0.centerY.equalToSuperview()
        }
        milesLabel.snp.makeConstraints {
            $0.leading.equalTo(myMilesLabel.snp.trailing).offset(UIScreen.main.bounds.width / 186.6)
            $0.centerY.equalToSuperview()
        }
    }
}
