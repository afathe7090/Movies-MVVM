//
//  Movie.swift
//  Movies
//
//  Created by Ahmed Fathy on 22/01/2023.
//

import Foundation

// MARK: - Movie
struct MovieModel: Codable {
    let page: Int?
    let results: [MovieModelData]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieModelData: Codable {
    let overview: String?
    let posterPath: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case overview
        case posterPath = "poster_path"
        case title
    }
}
