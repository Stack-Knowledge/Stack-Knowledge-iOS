//
//  HomeGradeCollectionViewCell.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/18.
//

import UIKit
import SnapKit
import Then

class HomeGradeCollectionViewCell: UICollectionViewCell {
    
    let teacherNameLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.textAlignment = .center
        $0.text = "미소썜"
        $0.textColor = .black
    }
    
    let problemLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Light", size: 12)
        $0.textAlignment = .center
        $0.text = "북학파의 배경"
        $0.textColor = .black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        addSubview(teacherNameLabel)
        addSubview(problemLabel)
    }
    
    private func setLayout() {
        teacherNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(24)
        }
        
        problemLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.teacherNameLabel.snp.bottom).offset(12)
        }
    }
}
