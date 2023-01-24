//
//  MovieSectionViewModel.swift
//  Movies
//
//  Created by Ahmed Fathy on 22/01/2023.
//

import Combine
final class MovieSectionViewModel {
    let dataSource: [MovieModelData]
    @Published var didSelectPublisher: MovieModelData?
    @Published var didScrollCell: Void?
    init(movies: [MovieModelData]) {
        self.dataSource = movies
    }
}
