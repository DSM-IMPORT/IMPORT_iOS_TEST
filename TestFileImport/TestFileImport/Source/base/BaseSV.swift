//
//  BaseSV.swift
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

class BaseSV: BaseVC, Stepper {
    
    var steps = PublishRelay<Step>()
        
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.gray,
                      .font : UIFont.systemFont(ofSize: 14, weight: .bold)]
    
    internal lazy var firstTitle = UILabel().then {
        $0.text = "기존의 계정으로 계속해요"
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.numberOfLines = 1
        $0.textColor = .black
    }
    
    internal lazy var secondTitle = UILabel().then {
        $0.text = "계정 정보를 입력하여 시작해 보세요"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.numberOfLines = 1
        $0.textColor = .gray
    }
    
    internal lazy var firstTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    internal lazy var secondTextField = UITextField().then {
        $0.borderStyle = UITextField.BorderStyle.none
        $0.returnKeyType = UIReturnKeyType.done
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        $0.leftViewMode = .always
        $0.textColor = .black
    }
    
    internal lazy var usernameLine = UIView().then {
        $0.backgroundColor = .gray
    }
    internal lazy var passwordLine = UIView().then {
        $0.backgroundColor = .gray
    }
    
    internal lazy var loginFirstNextButton = UIButton().then {
        $0.setTitle("계속", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 8.0
    }
    
    override func viewDidLoad() {
        updateWith(self)
        print("난 base에 갇쳐있어")
    }
    
    func updateWith(_ controller: UIViewController) {
        [
            firstTitle,
            secondTitle,
            firstTextField,
            secondTextField,
            usernameLine,
            passwordLine,
            loginFirstNextButton
        ].forEach { controller.view.addSubview($0) }
        
        let width = controller.view.frame.width / 430.0
        let height = controller.view.frame.height / 932.0
        
        firstTitle.snp.makeConstraints {
            $0.top.equalTo(controller.view.safeAreaLayoutGuide).offset(60.0)
            $0.leading.equalToSuperview().inset(24.0)
        }
        
        secondTitle.snp.makeConstraints {
            $0.top.equalTo(firstTitle.snp.bottom).offset(10.0)
            $0.leading.equalTo(firstTitle.snp.leading)
        }
        
        firstTextField.snp.makeConstraints {
            $0.top.equalTo(secondTitle.snp.bottom).offset(60.0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(382.0 * width)
            $0.height.equalTo(46.0 * height)
        }
        
        secondTextField.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom).offset(16.0)
            $0.centerX.equalTo(firstTextField.snp.centerX)
            $0.width.equalTo(firstTextField.snp.width)
            $0.height.equalTo(firstTextField.snp.height)
        }
        
        usernameLine.snp.makeConstraints {
            $0.top.equalTo(firstTextField.snp.bottom)
            $0.leading.equalTo(firstTextField.snp.leading)
            $0.height.equalTo(2.0)
            $0.width.equalTo(382)
        }
        
        passwordLine.snp.makeConstraints {
            $0.top.equalTo(secondTextField.snp.bottom)
            $0.leading.equalTo(secondTextField.snp.leading)
            $0.height.equalTo(2.0)
            $0.width.equalTo(382)
        }
        
        loginFirstNextButton.snp.makeConstraints {
            $0.height.equalTo(48.0)
            $0.width.equalTo(398.0)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordLine.snp.bottom).offset(405)
        }
    }
    func animate(line: UIView) {
        line.alpha = 0.3
        UIView.animate(withDuration: 1) {
            line.alpha = 1
        }
    }
    
    func changePasswordButtonDidTap() {
//        self.steps.accept(IMPORTStep.homeIsRequired)
        self.steps.accept(IMPORTStep.homeIsRequired)
        print("계속 버튼 눌림 😀")
    }
    
    @objc
    func nextButtonDidTap() {
        print("계속 버튼 눌림 😀")
    }

}
