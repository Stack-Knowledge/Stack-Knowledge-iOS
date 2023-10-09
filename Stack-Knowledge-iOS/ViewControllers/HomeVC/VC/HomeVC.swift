//
//  HomeVC.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/07.
//

import UIKit

class HomeVC: BaseVC, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellReuseIdentifier1 = "ProblemCell"
    let cellReuseIdentifier2 = "GradeCell"
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    let items2 = ["Item 1", "Item 2", "Item 3", "Item 4"]
    
    let bannerImages = ["banner1", "banner2", "banner3"]
    var currentBannerIndex = 0
    var bannerTimer: Timer?
    
    private let customTopLogoUiView = CustomTopLogoUiView()
    
    private let bannerImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
        
    private let solveTimeExampleLabel = UILabel().then {
        $0.text = "* 문제는 12:30 ~ 19:30분까지 풀수 있습니다."
        $0.font = UIFont(name: "Pretendard-Light", size: 12)
    }
    
    private let solveProblemLabel = UILabel().then {
        $0.text = "문제 풀기"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 18)
    }
    
    private let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.scrollDirection = .horizontal
        $0.sectionInset = UIEdgeInsets(top: 0, left: 15.44, bottom: 0, right: 15.44)
        $0.minimumLineSpacing = 15.44
    })).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(red: 235, green: 235, blue: 235)
        $0.showsHorizontalScrollIndicator = false
        $0.layer.cornerRadius = 20
    }
    
    private let homeGradeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then({
        $0.scrollDirection = .horizontal
        $0.sectionInset = UIEdgeInsets(top: 0, left: 15.44, bottom: 0, right: 15.44)
        $0.minimumLineSpacing = 15.44
    })).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(red: 235, green: 235, blue: 235)
        $0.showsHorizontalScrollIndicator = false
        $0.layer.cornerRadius = 20
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerImageView.image = UIImage(named: bannerImages[currentBannerIndex])
        startBannerTimer()
    }
    
    override func addView() {
        view.addSubview(customTopLogoUiView)
        view.addSubview(bannerImageView)
        view.addSubview(solveTimeExampleLabel)
        view.addSubview(solveProblemLabel)
        view.addSubview(homeCollectionView)
        view.addSubview(homeGradeCollectionView)
    }
    
    override func setLayout() {
        bannerImageView.snp.makeConstraints {
            $0.top.equalTo(customTopLogoUiView.snp.bottom).offset(80)
            $0.leading.trailing.equalToSuperview().inset(0)
            //$0.height.equalTo(180)
        }
        
        solveTimeExampleLabel.snp.makeConstraints {
            $0.bottom.equalTo(bannerImageView.snp.bottom).offset(0)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        solveProblemLabel.snp.makeConstraints {
            $0.top.equalTo(solveTimeExampleLabel.snp.bottom).offset(32)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(solveProblemLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(180)
        }
        
        homeGradeCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeCollectionView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(180)
        }
    }
    
    override func addTarget() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
    }
    
    override func delegate() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier1)
        
        homeGradeCollectionView.delegate = self
        homeGradeCollectionView.dataSource = self
        homeGradeCollectionView.register(HomeGradeCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier2)
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            showNextBanner()
        } else if gesture.direction == .right {
            showPreviousBanner()
        }
        
        resetBannerTimer()
    }
    
    func startBannerTimer() {
        bannerTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(advanceToNextBanner), userInfo: nil, repeats: true)
    }
    
    func resetBannerTimer() {
        bannerTimer?.invalidate()
        startBannerTimer()
    }
    
    @objc func advanceToNextBanner() {
        showNextBanner()
    }
    
    func showNextBanner() {
        currentBannerIndex = (currentBannerIndex + 1) % bannerImages.count
        updateBannerImage()
    }
    
    func showPreviousBanner() {
        currentBannerIndex = (currentBannerIndex - 1 + bannerImages.count) % bannerImages.count
        updateBannerImage()
    }
    
    func updateBannerImage() {
        UIView.transition(with: bannerImageView, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.bannerImageView.image = UIImage(named: self.bannerImages[self.currentBannerIndex])
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeCollectionView {
            return items.count
        }
        else {
            return items2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier1, for: indexPath) as! HomeCollectionViewCell
            
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier2, for: indexPath) as! HomeGradeCollectionViewCell
            
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 116.77, height: 148)
    }
}
