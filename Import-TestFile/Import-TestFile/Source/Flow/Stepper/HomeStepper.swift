import Foundation
import RxFlow
import RxCocoa
import RxSwift

class HomeStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    var initialStep: Step {
        return IMPORTStep.homeIsRequired
    }
}
