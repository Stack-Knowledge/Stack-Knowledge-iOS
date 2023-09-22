//
//  ProblemVC.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/18.
//

import UIKit

class ProblemVC: BaseVC {
    
    var timer: Timer?
    var minutes = 13
    var seconds = 00
    
    private let customTopLogoUiView = CustomTopLogoUiView()
    
    private let circleUiView = UIView().then {
        $0.layer.borderColor = UIColor(red: 255, green: 169, blue: 39).cgColor
        $0.layer.borderWidth = 4
        $0.layer.cornerRadius = 85
    }
    
    private let timerLabel = UILabel().then {
        $0.text = "13 : 00"
        $0.font = UIFont(name: "Pretendard-Medium", size: 40)
        $0.textAlignment = .center
    }
    
    private let problemLabel = UILabel().then {
        $0.text = "문제"
        $0.font = UIFont(name: "Pretendard-Medium", size: 18)
    }
    
    override func addView() {
        view.addSubview(customTopLogoUiView)
        view.addSubview(circleUiView)
        view.addSubview(timerLabel)
        view.addSubview(problemLabel)
    }
    
    override func setLayout() {
        circleUiView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(69)
            $0.width.height.equalTo(170)
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(130)
            $0.centerX.equalToSuperview()
        }
    
        problemLabel.snp.makeConstraints {
            $0.top.equalTo(circleUiView.snp.bottom).offset(40)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    override func addTarget() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds > 0 {
            seconds -= 1
        } else if minutes > 0 {
            minutes -= 1
            seconds = 59
        } else {
            timer?.invalidate()
        }
        
        updateTimeLabel()
    }
    
    func updateTimeLabel() {
        let timeString = String(format: "%02d : %02d", minutes, seconds)
        timerLabel.text = timeString
    }
}
