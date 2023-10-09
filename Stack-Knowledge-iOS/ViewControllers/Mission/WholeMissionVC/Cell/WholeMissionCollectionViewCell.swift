//
//  WholeMissionCollectionViewCell.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/20.
//

import UIKit
import SnapKit
import Then

class WholeMissionCollectionViewCell: UICollectionViewCell {
    
    let teacherNameLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        $0.text = "미소쌤"
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    let missionExplainLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.text = "여기에 한줄 설명 적을거임"
        $0.textAlignment = .center
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
        addSubview(missionExplainLabel)
    }
    
    private func setLayout() {
        teacherNameLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(28)
            $0.leading.trailing.equalToSuperview()
        }
        
        teacherNameLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).inset(65)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
