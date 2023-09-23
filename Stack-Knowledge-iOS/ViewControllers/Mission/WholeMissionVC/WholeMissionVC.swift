//
//  WholeMissionVC.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/20.
//

import UIKit

class WholeMissionVC: BaseVC, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let wholeMissionCellReuseIdentifier = "WholeMissionCell"
    
    private let customTopLogoUiView = CustomTopLogoUiView()
    
    private let WholeMissionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then ({
        $0.minimumInteritemSpacing = 16
        $0.sectionInset = UIEdgeInsets(top: 9, left: 16, bottom: 0, right: 16)
    })).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubview(customTopLogoUiView)
        view.addSubview(WholeMissionCollectionView)
    }
    
    override func setLayout() {
        WholeMissionCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(29)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(633)
        }
    }
    
    override func delegate() {
        WholeMissionCollectionView.delegate = self
        WholeMissionCollectionView.dataSource = self
        WholeMissionCollectionView.register(WholeMissionCollectionViewCell.self, forCellWithReuseIdentifier: wholeMissionCellReuseIdentifier)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: wholeMissionCellReuseIdentifier, for: indexPath) as! WholeMissionCollectionViewCell
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        cell.layer.shadowRadius = 4
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let missionVC = MissionVC()
        self.navigationController?.setViewControllers([missionVC], animated: true)
    }
}
