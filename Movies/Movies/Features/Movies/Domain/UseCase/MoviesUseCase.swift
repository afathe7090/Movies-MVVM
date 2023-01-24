//
//  MoviesUseCase.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import Foundation
import Combine
class MoviesUseCase: MoviesUseCaseProtocol {
    private let repo: MoviesRepoProtocol
    required init(repository: MoviesRepoProtocol) {
        self.repo = repository
    }
    func getMovies(page: Int) -> AnyPublisher<MovieModel, Error> {
        repo.getMovies(page: page)
    }
}
