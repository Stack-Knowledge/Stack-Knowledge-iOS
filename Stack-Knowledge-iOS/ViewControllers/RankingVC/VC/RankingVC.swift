//
//  RankingVC.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/10/12.
//

import UIKit

class RankingVC: BaseVC, UITableViewDataSource, UITableViewDelegate {
    
    private let customTopLogoUiView = CustomTopLogoUiView()
    
    private let profileImageVIew = UIImageView().then {
        $0.image = UIImage(named: "ProfileImage")
    }
    
    private let rankingLabel = UILabel().then {
        $0.text = "랭킹"
        $0.font = UIFont(name: "Pretendard-Medium", size: 20)
    }
    
    private let rankingTableView = UITableView().then {
        $0.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubview(customTopLogoUiView)
        view.addSubview(profileImageVIew)
        view.addSubview(rankingLabel)
        view.addSubview(rankingTableView)
    }
    
    override func setLayout() {
        profileImageVIew.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(110)
        }
        rankingLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageVIew.snp.bottom).offset(85)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(29)
        }
        rankingTableView.snp.makeConstraints {
            $0.top.equalTo(rankingLabel.snp.bottom).offset(19)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(0)
        }
    }
    
    override func delegate() {
        rankingTableView.dataSource = self
        rankingTableView.delegate = self
        rankingTableView.register(RankingTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! RankingTableViewCell
        let cellBackground = UIView()
        cell.rowLabel.text = "\(indexPath.row + 1)"
        cellBackground.backgroundColor = UIColor(red: 255, green: 215, blue: 155)
        cell.selectedBackgroundView = cellBackground
        return cell
    }
}
