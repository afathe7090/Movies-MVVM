//
//  Router.swift
//  Coordinator_Pattern
//
//  Created by Ahmed Fathy on 17/01/2023.
//

import UIKit

public protocol Router {
    var navigationController: UINavigationController { get }
    init(navigationController: UINavigationController)
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func show(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    func popToRoot(animated: Bool)
}
