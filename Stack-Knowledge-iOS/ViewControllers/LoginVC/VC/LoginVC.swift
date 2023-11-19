//
//  ViewController.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/08/08.
//

import UIKit
import GAuthSignin

class LoginVC: BaseVC {
    
    public var codes = ""
    
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
            $0.width.equalTo(view.bounds.width / 1.1)
            $0.height.equalTo(view.bounds.height / 2.25)
        }
        
        stackKnowledgeBackgroundImage2.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaInsets).inset(0)
            $0.trailing.equalTo(view.safeAreaInsets).inset(0)
            $0.width.equalTo(view.bounds.width / 1.444)
            $0.height.equalTo(view.bounds.height / 3.21)
        }
        
        stackKnowledgeLogoImageView.snp.makeConstraints {
            $0.width.equalTo(view.bounds.width / 7.8)
            $0.height.equalTo(view.bounds.height / 16.9)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(view.bounds.height / 4.69)
            $0.centerX.equalToSuperview()
        }
        
        stackKnowledgeLogoLabel.snp.makeConstraints {
            $0.top.equalTo(stackKnowledgeLogoImageView.snp.bottom).offset(view.bounds.height / 42.2)
            $0.centerX.equalToSuperview()
        }
        
        gauthButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(view.bounds.height / 8.3)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(view.bounds.width / 1.22)
            $0.height.equalTo(view.bounds.height / 16.88)
        }
    }
    
    func gauthBtnTapped() {
        gauthButton.prepare(
            clientID: "e6e8ac7857c94ca7a24db504d33369078ab562d7a29a4c9db353204ae8080be9",
            redirectURI: "https://port-0-stack-knowledge-server-1xxfe2bllyrfbtt.sel5.cloudtype.app",
            presenting: self
        ) { code in
            print(code)
            PostGauthDataService.shared.postGauthInfo(code: code) { result in
                switch result {
                case .success(let data):
                    print(data)
                    self.navigationController?.setViewControllers([CustomTabBarController()], animated: true)
                    break;
                case .requestErr(_):
                    print("requestErr")
                    break;
                case .pathErr:
                    print("pathErr")
                    break;
                case .serverErr:
                    print("serverErr")
                    break;
                case .networkFail:
                    print("networkFail")
                    break;
                }
            }
        }
    }
}

