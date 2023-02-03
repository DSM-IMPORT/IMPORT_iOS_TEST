//
//  AppStepper.swift
//  TestFileImport
//
//  Created by 박준하 on 2023/02/03.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    //시작 페이지
    var initialStep: Step {
        return IMPORTStep.homeIsRequired
    }
}
