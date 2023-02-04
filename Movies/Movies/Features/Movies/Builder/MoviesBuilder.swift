//
//  MoviesBuilder.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import UIKit
struct MoviesBuilder {
    private init() {}
    static func moviesBuilder(coordinator: MoviesCoordinatorPresentable) -> MoviesViewController {
        let remoteRepo: MoviesRepoRemoteProtocol = MoviesRepoRemoteImple()
        let repo: MoviesRepoProtocol = MoviesRepoImple(remote: remoteRepo)
        let useCase: MoviesUseCaseProtocol = MoviesUseCase(repository: repo)
        let viewModel: MoviesViewModelProtocol = MoviesViewModel(useCase: useCase)
        let viewController = MoviesViewController(viewModel: viewModel, coordinator: coordinator)
        return viewController
    }
}
