import Foundation
import RxFlow
import RxCocoa
import RxSwift
import UIKit

class AppFlow: Flow {
    var window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? IMPORTStep else { return .none }
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
        case .homeIsRequired:
            return self.navigateToHome()
        case .signupIsRequired:
            return self.navigateToSignup()
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: IMPORTStep.loginIsRequired)))
    }
    
    private func navigateToHome() -> FlowContributors {
        let homeFlow = HomeFlow()
        Flows.use(homeFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: homeFlow, withNextStepper: OneStepper(withSingleStep: IMPORTStep.homeIsRequired)))
    }
    
    private func navigateToSignup() -> FlowContributors {
        let signupFlow = SignupFlow()
        Flows.use(signupFlow, when: .created) { (root) in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: signupFlow, withNextStepper: OneStepper(withSingleStep: IMPORTStep.signupIsRequired)))
    }
}
