//
//  SceneDelegate.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import UIKit
import Coordinator
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var appCoordinator: AppCoordinator?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let rootNavigationController = UINavigationController()
        let router: Router = NavigationRouter(navigationController: rootNavigationController)
        let window: UIWindow = UIWindow(windowScene: scene)
        appCoordinator = AppCoordinator(router: router, window: window)
        appCoordinator?.start()
    }

}
