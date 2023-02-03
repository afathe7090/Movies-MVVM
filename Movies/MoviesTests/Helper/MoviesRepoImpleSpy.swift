//
//  MoviesRepoImpleSpy.swift
//  MoviesTests
//
//  Created by Ahmed Fathy on 04/02/2023.
//

import Combine
@testable import Movies

final class MoviesRepoImpleSpy: MoviesRepoProtocol {
    
    private let remote: MoviesRepoRemoteProtocol
    required init(remote: MoviesRepoRemoteProtocol) {
        self.remote = remote
    }
    func getMovies(page: Int) -> AnyPublisher<Movies.MovieModel, Error> {
        remote.getMovies(page: page)
    }
    
}
