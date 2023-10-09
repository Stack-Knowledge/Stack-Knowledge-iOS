//
//  ShopVC.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/23.
//

import UIKit

class ShopVC: BaseVC, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let shopCellReuseIdentifier = "cell"
    
    private let customTopLogoUiView = CustomTopLogoUiView()
    
    private let nowMilesLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Medium", size: 24)
        $0.text = "현재 마일리지"
    }
    
    private let merchandiseLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        $0.text = "상품"
    }
    
    private let shopCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then ({
        $0.minimumInteritemSpacing = 16
        $0.sectionInset = UIEdgeInsets(top: 9, left: 16, bottom: 0, right: 16)
    })).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    private let customStackKnowledgeButton = CustomStackKnowledgeButton(description: "선택하기")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCustomStackKnowledgeButtonVisibility()
    }
    override func addView() {
        view.addSubview(customTopLogoUiView)
        view.addSubview(nowMilesLabel)
        view.addSubview(merchandiseLabel)
        view.addSubview(shopCollectionView)
        view.addSubview(customStackKnowledgeButton)
    }
    
    override func setLayout() {
        nowMilesLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.leading.trailing.equalToSuperview().inset(122)
        }
        
        merchandiseLabel.snp.makeConstraints {
            $0.top.equalTo(nowMilesLabel.snp.bottom).offset(124)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        shopCollectionView.snp.makeConstraints {
            $0.top.equalTo(merchandiseLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(332)
        }
        
        customStackKnowledgeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }
    }
    
    override func addTarget() {
        customStackKnowledgeButton.addTarget(self, action: #selector(customStackKnowledgeButtonTapped(_:)), for: .touchUpInside)
    }
    
    override func delegate() {
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
        shopCollectionView.register(ShopCollectionViewCell.self, forCellWithReuseIdentifier: shopCellReuseIdentifier)
    }
    
    func updateCustomStackKnowledgeButtonVisibility() {
        if ShopCollectionViewCell.selectedCount > 0 {
            customStackKnowledgeButton.isHidden = false
        } else {
            customStackKnowledgeButton.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shopCellReuseIdentifier, for: indexPath) as! ShopCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 202)
    }
    
    @objc func customStackKnowledgeButtonTapped(_ sender: UIButton) {
        let bottomSheetVC = ShopBottomSheetVC()
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        self.present(bottomSheetVC, animated: false, completion: nil)
    }
}
