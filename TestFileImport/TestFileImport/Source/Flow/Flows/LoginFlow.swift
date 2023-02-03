//
//  LoginFlow.swift
//  TestFileImport
//
//  Created by 박준하 on 2023/02/03.
//
import UIKit
import RxFlow
import Then

class LoginFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    init(){}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? IMPORTStep else { return .none }
        switch step {
        case .loginIsRequired:
            return navigateToLogin()
        case .homeIsRequired:
            return .end(forwardToParentFlowWithStep: IMPORTStep.homeIsRequired)
        case .signupIsRequired:
            return .none
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let viewController = EmailLoginViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
