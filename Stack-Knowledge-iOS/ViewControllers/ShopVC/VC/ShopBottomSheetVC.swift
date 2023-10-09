//
//  ShopBottomSheetController.swift
//  Stack-Knowledge-iOS
//
//  Created by AnnKangHo on 2023/09/24.
//

import UIKit
import SnapKit
import Then

class ShopBottomSheetVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let merchandiseReuseIdentifier = "merchandiseCell"
    
    let bottomHeight: CGFloat = 375
    
    private var bottomSheetViewTopConstraint: Constraint?
    
    private let dimmedBackView = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    private let bottomSheetView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 27
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        $0.clipsToBounds = true
    }
    
    private let dismissIndicatorView = UIView().then {
        $0.backgroundColor = .systemGray2
        $0.layer.cornerRadius = 3
    }
    
    private let merchandiseCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then ({
        $0.minimumInteritemSpacing = 16
        $0.sectionInset = UIEdgeInsets(top: 9, left: 16, bottom: 0, right: 16)
    })).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    private let customStackKnowledgeButton = CustomStackKnowledgeButton(description: "구매하기")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        setupGestureRecognizer()
        delegate()
        addTarget()
    }

    private func addView() {
        view.addSubview(dimmedBackView)
        view.addSubview(bottomSheetView)
        view.addSubview(dismissIndicatorView)
        view.addSubview(customStackKnowledgeButton)
        bottomSheetView.addSubview(merchandiseCollectionView)
        bottomSheetView.addSubview(customStackKnowledgeButton)
        
        dimmedBackView.alpha = 0.0
        setupLayout()
    }
    
    private func setupGestureRecognizer() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        dimmedBackView.addGestureRecognizer(dimmedTap)
        dimmedBackView.isUserInteractionEnabled = true
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(panGesture))
        swipeGesture.direction = .down
        view.addGestureRecognizer(swipeGesture)
    }
    
    private func delegate() {
        merchandiseCollectionView.dataSource = self
        merchandiseCollectionView.delegate = self
        merchandiseCollectionView.register(MerchandiseCollectionViewCell.self, forCellWithReuseIdentifier: merchandiseReuseIdentifier)
    }
    
    private func addTarget() {
        customStackKnowledgeButton.addTarget(self, action: #selector(customStackKnowledgeButtonTapped(_:)), for: .touchUpInside)
    }
    private func setupLayout() {
        dimmedBackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        let topConstant = view.safeAreaInsets.bottom + view.safeAreaLayoutGuide.layoutFrame.height
        bottomSheetView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            self.bottomSheetViewTopConstraint = $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topConstant).constraint
        }
        dismissIndicatorView.snp.makeConstraints {
            $0.width.equalTo(36)
            $0.height.equalTo(2)
            $0.top.equalTo(bottomSheetView.snp.top).offset(12)
            $0.centerX.equalTo(bottomSheetView.snp.centerX)
        }
        merchandiseCollectionView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(150)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(150)
        }
        customStackKnowledgeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }
    }
    
    private func showBottomSheet() {
        let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding: CGFloat = view.safeAreaInsets.bottom
        
        bottomSheetViewTopConstraint?.update(offset: (safeAreaHeight + bottomPadding) - bottomHeight)
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedBackView.alpha = 0.5
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func hideBottomSheetAndGoBack() {
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        bottomSheetViewTopConstraint?.update(offset: safeAreaHeight + bottomPadding)
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.dimmedBackView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showBottomSheet()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ShopCollectionViewCell.selectedCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: merchandiseReuseIdentifier, for: indexPath) as! MerchandiseCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 343, height: 61)
    }
    
    func transitionToHomeVC() {
        dismiss(animated: false, completion: nil)
    }
    
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheetAndGoBack()
    }
    
    @objc func panGesture(_ recognizer: UISwipeGestureRecognizer) {
        if recognizer.state == .ended {
            switch recognizer.direction {
            case .down:
                hideBottomSheetAndGoBack()
            default:
                break
            }
        }
    }
    
    @objc func customStackKnowledgeButtonTapped(_ sender: UIButton) {
        let customDialogPurchaseViewController = CustomDialogPurchaseViewController()
        customDialogPurchaseViewController.okButtonAction = { [weak self] in
            customDialogPurchaseViewController.dismiss(animated: false, completion: nil)
            self?.transitionToHomeVC()
        }
        
        customDialogPurchaseViewController.modalPresentationStyle = .overCurrentContext
        customDialogPurchaseViewController.view.alpha = 0.0
        present(customDialogPurchaseViewController, animated: false) {
            UIView.animate(withDuration: 0.3) {
                customDialogPurchaseViewController.view.alpha = 1.0
            }
        }
    }
}
