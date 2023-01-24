//
//  MoviesProvider.swift
//  Networking
//
//  Created by Ahmed Fathy on 22/01/2023.
//

import Moya
import Combine
import CombineMoya

public protocol MoviesProviding: AnyObject {
    func getMovies<Movies: Codable>(page: Int, from model: Movies.Type) -> AnyPublisher< Movies , Error >
}

public final class MoviesProvider: MoviesProviding {
    private let provider = MoyaProvider<MoviesService>()
    public init() {}
    public func getMovies<Movies: Codable>(page: Int, from model: Movies.Type) -> AnyPublisher< Movies , Error > {
        return provider
            .requestPublisher(.movies(page))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(Movies.self)
            .mapError({$0 as Error})
            .eraseToAnyPublisher()
    }
}
