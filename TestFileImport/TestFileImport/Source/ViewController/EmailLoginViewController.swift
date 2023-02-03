//
//  EmailLoginViewController.swift
//  Import-TestFile
//
//  Created by 박준하 on 2023/02/03.
//

import UIKit
import SnapKit
import RxFlow
import RxSwift
import RxCocoa

class EmailLoginViewController: BaseSV {
    
    var initialStep: Step {
        IMPORTStep.homeIsRequired
    }
    
    private lazy var changePasswordButton = UIButton().then {
        $0.setTitle("비밀번호 바꾸기", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        $0.layer.cornerRadius = 8.0
    }
    
    override func viewDidLoad() {
        updateWith(self)
        print("난 emailLoginViewController야")
    }
    
    override func updateWith(_ controller: UIViewController) {
        super.updateWith(controller)
        
        lazy var textFields = [firstTextField, secondTextField]
        let placeholders = ["이름을 입력해 주세요.", "비밀번호를 입력해 주세요."]
        
        controller.view.addSubview(changePasswordButton)
        
        changePasswordButton.snp.makeConstraints {
            $0.height.equalTo(loginFirstNextButton.snp.height)
            $0.width.equalTo(loginFirstNextButton.snp.width)
            $0.centerX.equalTo(loginFirstNextButton.snp.centerX)
            $0.top.equalTo(loginFirstNextButton.snp.bottom)
            $0.bottom.equalToSuperview().inset(34.0)
        }

        var index = 0
        for textField in textFields {
            textField.attributedPlaceholder = NSAttributedString(string: placeholders[index],
                                                                  attributes: attributes)
//            textField.delegate = self
            index += 1
        }
        changePasswordButton.rx.tap
            .bind {
                self.changePasswordButtonDidTap()
//                self.steps.accept(IMPORTStep.homeIsRequired)
                print("인식 했습니다")
            }.disposed(by: disposeBag)
        
//        self.view.backgroundColor = .White
        controller.view.backgroundColor = .white
    }
}

//extension EmailLoginViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        switch textField {
//        case firstTextField: animate(line: usernameLine)
//        case secondTextField: animate(line: passwordLine)
//        default: return
//        }
//    }
//}

