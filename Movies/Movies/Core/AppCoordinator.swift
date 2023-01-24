//
//  AppCoordinator.swift
//  Coordinator_Pattern
//
//  Created by Ahmed Fathy on 17/01/2023.
//

import UIKit
import Coordinator

final class AppCoordinator: Coordinator {
   
    var childCoordinators: [Coordinator] = []
    let router: Router
    var window: UIWindow?
    
    public init(router: Router) {
        self.router = router
       }
    init(router: Router, window: UIWindow) {
        self.router = router
        self.window = window
    }
    
    func start() {
        let moviesCoordinator = MoviesCoordinator(router: router)
        childCoordinators.append(moviesCoordinator)
        moviesCoordinator.start()
        window?.rootViewController = router.navigationController
        window?.makeKeyAndVisible()
    }
}
