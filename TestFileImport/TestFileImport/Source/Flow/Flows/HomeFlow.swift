//
//  HomeFlow.swift
//  TestFileImport
//
//  Created by 박준하 on 2023/02/03.
//

import Foundation
import RxFlow
import UIKit

class HomeFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init() {}

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? IMPORTStep else { return .none }
        switch step {
        case .homeIsRequired:
            return self.navigateToHome()
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: IMPORTStep.loginIsRequired)
        case .signupIsRequired:
            return .end(forwardToParentFlowWithStep: IMPORTStep.signupIsRequired)
        }
    }
    
    private func navigateToHome() -> FlowContributors {
        let viewController = StratViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
