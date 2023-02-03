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
