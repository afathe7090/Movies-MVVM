//
//  Routing.swift
//  Coordinator_Pattern
//
//  Created by Ahmed Fathy on 17/01/2023.
//

import Foundation
import UIKit
public final class NavigationRouter: Router {
    public unowned let navigationController: UINavigationController
    public required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    public func present(_ viewController: UIViewController, animated: Bool) {
        navigationController.present(viewController, animated: animated)
    }
    public func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        navigationController.present(viewController, animated: animated, completion: completion)
    }
    public func dismiss(animated: Bool) {
        navigationController.dismiss(animated: true)
    }
    public func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }
    public func show(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: true)
    }
    public func pop(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    public func popToViewController(_ viewController: UIViewController, animated: Bool) {
        navigationController.popToViewController(viewController, animated: true)
    }
    public func popToRoot(animated: Bool) {
        navigationController.popToRootViewController(animated: animated)
    }
}
