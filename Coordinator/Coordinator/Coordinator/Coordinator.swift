//
//  Coordinator.swift
//  Coordinator_Pattern
//
//  Created by Ahmed Fathy on 17/01/2023.
//

import Foundation

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get }
    init(router: Router) 
    func start()
}
