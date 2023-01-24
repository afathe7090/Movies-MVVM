//
//  MoviesRepoRemoteImple.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import Combine
import Networking
final class MoviesRepoRemoteImple: MoviesRepoRemoteProtocol {
    private let provider: MoviesProviding
    init(provider: MoviesProviding = MoviesProvider()) {
        self.provider = provider
    }
    func getMovies(page: Int) -> AnyPublisher< MovieModel, Error> {
        provider.getMovies(page: page, from: MovieModel.self)
            .eraseToAnyPublisher()
    }
}
