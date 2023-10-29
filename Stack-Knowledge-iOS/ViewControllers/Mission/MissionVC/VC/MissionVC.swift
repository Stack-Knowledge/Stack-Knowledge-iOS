//
//  ProblemVC.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/18.
//

import UIKit

class MissionVC: BaseVC {
    
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
    
    private let missionLabel = UILabel().then {
        $0.text = "문제"
        $0.font = UIFont(name: "Pretendard-Medium", size: 18)
    }
    
    private let missionExplainLabel = UILabel().then {
        $0.text = "북학파에 대한 배경을 적고 일이 일어난 순서를 알맞게 서술하시오."
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.sizeToFit()
    }
    
    private let missionTextView = UITextView().then {
        $0.backgroundColor = UIColor(red: 235, green: 235, blue: 235)
        $0.layer.cornerRadius = 10
        $0.text = "답변을 작성해 주시기 바랍니다."
        $0.font = UIFont(name: "Pretendard-Medium", size: 14)
        $0.textColor = .placeholderText
        $0.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    private let customStackKnowledgeButton = CustomStackKnowledgeButton(description: "제출하기")
    
    override func addView() {
        view.addSubview(customTopLogoUiView)
        view.addSubview(circleUiView)
        view.addSubview(timerLabel)
        view.addSubview(missionLabel)
        view.addSubview(missionExplainLabel)
        view.addSubview(missionTextView)
        view.addSubview(customStackKnowledgeButton)
    }
    
    override func setLayout() {
        circleUiView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(view.bounds.height / 35.2)
            $0.width.height.equalTo(view.bounds.width / 2.3)
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(view.bounds.height / 9.93)
            $0.centerX.equalToSuperview()
        }
        
        missionLabel.snp.makeConstraints {
            $0.top.equalTo(circleUiView.snp.bottom).offset(view.bounds.height / 21.1)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(view.bounds.width / 24.375)
        }
        
        missionExplainLabel.snp.makeConstraints {
            $0.top.equalTo(missionLabel.snp.bottom).offset(view.bounds.height / 70.3)
            $0.leading.trailing.equalToSuperview().inset(view.bounds.width / 24.375)
        }
        
        missionTextView.snp.makeConstraints {
            $0.top.equalTo(missionLabel.snp.bottom).offset(view.bounds.height / 9.4)
            $0.leading.trailing.equalToSuperview().inset(view.bounds.width / 24.375)
            $0.height.equalTo(view.bounds.height / 4.7)
        }
        
        customStackKnowledgeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(view.bounds.height / 30.14)
            $0.leading.trailing.equalToSuperview().inset(view.bounds.width / 24.375)
            $0.height.equalTo(view.bounds.height / 14.1)
        }
    }
    
    override func addTarget() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        customStackKnowledgeButton.addTarget(self, action: #selector(customStackKnowledgeButtonTapped), for: .touchUpInside)
    }
    
    override func delegate() {
        tabBarController?.delegate = self
        missionTextView.delegate = self
    }
    
    @objc func updateTimer() {
        if minutes == 0 && seconds == 0 {
            let customDialogTimeOverViewController = CustomDialogTimeOverViewController()
            customDialogTimeOverViewController.okButtonAction = { [weak self] in
                customDialogTimeOverViewController.dismiss(animated: false, completion: nil)
                self?.transitionToHomeVC()
            }
            customDialogTimeOverViewController.modalPresentationStyle = .overCurrentContext
            customDialogTimeOverViewController.view.alpha = 0.0
            present(customDialogTimeOverViewController, animated: false) {
                UIView.animate(withDuration: 0.3) {
                    customDialogTimeOverViewController.view.alpha = 1.0
                }
            }
        }
        
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
    
    @objc func customStackKnowledgeButtonTapped(_ sender: UIButton) {
        let customDialogViewController = CustomDialogViewController()
        customDialogViewController.okButtonAction = { [weak self] in
            customDialogViewController.dismiss(animated: false, completion: nil)
            self?.transitionToHomeVC()
        }
        
        customDialogViewController.modalPresentationStyle = .overCurrentContext
        customDialogViewController.view.alpha = 0.0
        present(customDialogViewController, animated: false) {
            UIView.animate(withDuration: 0.3) {
                customDialogViewController.view.alpha = 1.0
            }
        }
    }
    
    func transitionToHomeVC() {
        let wholeMissionVC = WholeMissionVC()
        navigationController?.setViewControllers([wholeMissionVC], animated: true)
    }
}

extension MissionVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else { return }
        textView.textColor = .label
        textView.text = nil
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "텍스트 입력"
            textView.textColor = .placeholderText
        }
    }
}

