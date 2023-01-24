//
//  MoviesCoordinator.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import Coordinator
protocol MoviesCoordinatorPresentable: AnyObject {
    func movieDetail(_ movie: MovieModelData)
}
final class MoviesCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    private let router: Router
    required init(router: Router) {
        self.router = router
    }
    func start() {
        let moviesController = MoviesBuilder.moviesBuilder(coordinator: self)
        router.show(moviesController, animated: true)
    }
}
extension MoviesCoordinator: MoviesCoordinatorPresentable {
    func movieDetail(_ movie: MovieModelData) {
        // Navigate with data that pass to another Builder 🔥
        print(movie)
    }
}
