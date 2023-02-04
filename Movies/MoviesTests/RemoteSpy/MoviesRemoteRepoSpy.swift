//
//  MoviesRemoteRepoSpy.swift
//  MoviesTests
//
//  Created by Ahmed Fathy on 04/02/2023.
//

import Combine
@testable import Movies
final class MoviesRemoteRepoSpy: MoviesRepoRemoteProtocol {
    func getMovies(page: Int) -> AnyPublisher<Movies.MovieModel, Error> {
        return Future { promis in
            let movies = MovieModel(page: page,
                                    results: [.init(overview: "Movies OverView",
                                                    posterPath: "www.poster.com",
                                                    title: "Movies in Egypt")]
                                    , totalPages: 10
                                    , totalResults: 1221)
            promis(.success(movies))
        }.eraseToAnyPublisher()
    }
}
