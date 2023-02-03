//
//  SceneDelegate.swift
//  Import-TestFile
//
//  Created by 박준하 on 2023/02/03.
//

import UIKit
import RxFlow
import RxSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator = FlowCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let rootNavigationController = UINavigationController(rootViewController: ViewController())
        
        self.window?.rootViewController = rootNavigationController
        self.window?.makeKeyAndVisible()
    }
}



