import UIKit
import RxFlow
import RxSwift
import RxCocoa

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator = FlowCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        let appFlow = AppFlow(window: window)
        self.coordinator.coordinate(flow: appFlow, with: AppStepper())
        window.makeKeyAndVisible()
    }
}



