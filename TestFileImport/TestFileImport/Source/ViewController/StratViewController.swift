//
//  StratViewController.swift
//  TestFileImport
//
//  Created by 박준하 on 2023/02/03.
//

import UIKit
import SnapKit
import RxFlow
import RxSwift
import RxCocoa
import Then

class StratViewController: BaseVC, Stepper {
    var steps = PublishRelay<Step>()
    
    private lazy var importLogoTitle = UILabel().then {
        $0.text = "import"
        $0.font = .systemFont(ofSize: 40, weight: .semibold)
        $0.numberOfLines = 1
        $0.textColor = .black
    }
    
    private lazy var importIntroduceTitle = UILabel().then {
        $0.text = "쉽고 빠르게 실현하는 아이디어"
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 1
        $0.textColor = .gray
    }
    
    private lazy var importLogo = UIImageView().then {
        $0.image = UIImage(named: "ImportLogo")
    }
    
    private lazy var existingAccountButton = UIButton().then {
        $0.setTitle("기존의 계정으로 계속하기", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        $0.layer.cornerRadius = 8.0
    }
    
    private lazy var newAccountButton = UIButton().then {
        $0.setTitle("새로운 계정으로 계속하기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.addTarget(self, action: #selector(signupButtonDidTap), for: .touchUpInside)
        $0.layer.cornerRadius = 8.0
    }
    
    override func attribute() {
        print("startViewContoller")
        self.view.backgroundColor = .white
    }
    
    override func layout() {
        [
            importLogoTitle,
            importIntroduceTitle,
            importLogo,
            existingAccountButton,
            newAccountButton
        ].forEach { view.addSubview($0) }
        
        importLogoTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100.0)
        }
        
        importIntroduceTitle.snp.makeConstraints {
            $0.centerX.equalTo(importLogoTitle.snp.centerX)
            $0.top.equalTo(importLogoTitle.snp.bottom).offset(20.0)
        }
        
        importLogo.snp.makeConstraints {
            $0.height.width.equalTo(128.0)
            $0.centerX.centerY.equalToSuperview()
        }
        
        existingAccountButton.snp.makeConstraints {
            $0.height.equalTo(48.0)
            $0.width.equalTo(398.0)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(importLogo.snp.bottom).offset(264)
        }
        
        newAccountButton.snp.makeConstraints {
            $0.height.equalTo(existingAccountButton.snp.height)
            $0.width.equalTo(existingAccountButton.snp.width)
            $0.centerX.equalTo(existingAccountButton.snp.centerX)
            $0.top.equalTo(existingAccountButton.snp.bottom)
        }
    }
    
    @objc
    func loginButtonDidTap() {
        self.steps.accept(IMPORTStep.loginIsRequired)
    }
    
    @objc
    func signupButtonDidTap() {
        self.steps.accept(IMPORTStep.signupIsRequired)
    }
}
