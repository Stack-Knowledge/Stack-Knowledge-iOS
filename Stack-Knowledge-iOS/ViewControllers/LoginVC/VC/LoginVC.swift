//
//  ViewController.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/08/08.
//

import UIKit
import GAuthSignin

class LoginVC: BaseVC {
    
    private let stackKnowledgeBackgroundImage1 = UIImageView().then {
        $0.image = UIImage(named: "StackKnowledgeBackgroundImage1")
    }
    
    private let stackKnowledgeBackgroundImage2 = UIImageView().then {
        $0.image = UIImage(named: "StackKnowledgeBackgroundImage2")
    }
    
    private let stackKnowledgeLogoImageView = UIImageView().then {
        $0.image = UIImage(named: "StackKnowledgeLogo")
    }
    
    private let stackKnowledgeLogoLabel = UILabel().then {
        $0.text = "Stack Knowledge"
        $0.font = UIFont(name: "Roboto-Black", size: 24)
    }
    
    private let gauthButton = GAuthButton(auth: .signin, color: .colored, rounded: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gauthBtnTapped()
    }
    override func addView() {
        view.addSubview(stackKnowledgeBackgroundImage1)
        view.addSubview(stackKnowledgeBackgroundImage2)
        view.addSubview(stackKnowledgeLogoImageView)
        view.addSubview(stackKnowledgeLogoLabel)
        view.addSubview(gauthButton)
    }
    override func setLayout() {
        stackKnowledgeBackgroundImage1.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets).offset(0)
            $0.leading.equalTo(view.safeAreaInsets).offset(0)
            $0.width.equalTo(361.97)
            $0.height.equalTo(375)
        }
        
        stackKnowledgeBackgroundImage2.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaInsets).inset(0)
            $0.trailing.equalTo(view.safeAreaInsets).inset(0)
            $0.width.equalTo(270.37)
            $0.height.equalTo(262.91)
        }
        
        stackKnowledgeLogoImageView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(180)
            $0.centerX.equalToSuperview()
        }
        
        stackKnowledgeLogoLabel.snp.makeConstraints {
            $0.top.equalTo(stackKnowledgeLogoImageView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        gauthButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(102)
             $0.centerX.equalToSuperview()
             $0.width.equalTo(319)
             $0.height.equalTo(50)
        }
    }
    
    func gauthBtnTapped() {
        gauthButton.prepare(
             clientID: "e6e8ac7857c94ca7a24db504d33369078ab562d7a29a4c9db353204ae8080be9",
             redirectURI: "https://gauth.co.kr/login/oauth",
             presenting: self
        ) { code in
             print(code)
             self.navigationController?.setViewControllers([HomeVC()], animated: true)
        }
   }
}

