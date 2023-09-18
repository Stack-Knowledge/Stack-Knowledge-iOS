//
//  CustomTabBarController.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/18.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .black
        
        let appearance = tabBar.standardAppearance
        appearance.stackedLayoutAppearance.normal.iconColor = .gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        tabBar.standardAppearance = appearance
        
        let homeNavigationController = UINavigationController(rootViewController: HomeVC())
        homeNavigationController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "GotoHomePage"), selectedImage: nil)
        let problemNavigationController = UINavigationController(rootViewController: HomeVC())
        problemNavigationController.tabBarItem = UITabBarItem(title: "문제", image: UIImage(named: "GotoProblemPage"), selectedImage: nil)
        let storeNavigationController = UINavigationController(rootViewController: HomeVC())
        storeNavigationController.tabBarItem = UITabBarItem(title: "상점", image: UIImage(named: "GotoStorePage"), selectedImage: nil)
        let rankingNavigationController = UINavigationController(rootViewController: HomeVC())
        rankingNavigationController.tabBarItem = UITabBarItem(title: "랭킹", image: UIImage(named: "GotoRankingPage"), selectedImage: nil)
        viewControllers = [homeNavigationController, problemNavigationController, storeNavigationController, rankingNavigationController]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let desiredHeight: CGFloat = 90
        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = desiredHeight
        tabBarFrame.origin.y = view.frame.height - desiredHeight + 20 // 아래로 20 포인트 내립니다.
        tabBar.frame = tabBarFrame
    }
}

