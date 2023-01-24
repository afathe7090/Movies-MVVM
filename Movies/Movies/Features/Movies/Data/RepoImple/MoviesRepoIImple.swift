//
//  MoviesRepoIImple.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//
import Combine
import Networking
final class MoviesRepoImple: MoviesRepoProtocol {
    private let remote: MoviesRepoRemoteProtocol
    required init(remote: MoviesRepoRemoteProtocol) {
        self.remote = remote
    }
    func getMovies(page: Int) -> AnyPublisher<MovieModel, Error> {
        remote.getMovies(page: page)
    }
}
