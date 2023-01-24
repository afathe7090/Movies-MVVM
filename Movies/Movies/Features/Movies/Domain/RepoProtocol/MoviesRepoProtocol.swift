//
//  MoviesRepoProtocol.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//
import Combine
protocol MoviesRepoProtocol: AnyObject {
    func getMovies(page: Int) -> AnyPublisher< MovieModel, Error>
}
