//
//  MoviesRemoteRepoTests.swift
//  MoviesTests
//
//  Created by Ahmed Fathy on 04/02/2023.
//

import XCTest
import Combine
@testable import Movies

final class MoviesRemoteRepoTests: XCTestCase {
    
    var sut: MoviesRepoRemoteProtocol!
    var anyCancellable: Set<AnyCancellable>!
    var error: Error?
    var finished: Bool?
    var moviesModel: MovieModel?
    
    override func setUp() {
        super.setUp()
        self.sut = MoviesRemoteRepoSpy()
        self.anyCancellable = Set<AnyCancellable>()
        callMoviesResult()
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
        self.anyCancellable = nil
        self.error = nil
        self.finished = nil
    }
    
    private func callMoviesResult() {
        sut.getMovies(page: 1)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error): self.error = error }
            } receiveValue: { [weak self] movies in
                self?.moviesModel = movies
            }.store(in: &anyCancellable)
    }
    
    func test_moviesRemoteRepository_dataMoviesNotNUll() {
        XCTAssertNotNil(moviesModel)
    }
    
    func test_moviesRemoteRepository_dataMoviesPageCounter() {
        XCTAssertEqual(moviesModel?.page, 1)
    }
    
    func test_moviesRemoteRepository_dataMoviesErrorIsNull() {
        XCTAssertNil(error)
    }
    
    func test_moviesRemoteRepository_dataMoviesNotEmptyArray() {
        XCTAssertNotEqual(moviesModel?.results?.isEmpty, true)
    }
    
    func test_moviesRemoteRepository_totalPageCounterNotNull() {
        XCTAssertNotNil(moviesModel?.totalPages)
    }
    
    func test_moviesRemoteRepository_totalPageCount() {
        XCTAssertEqual(moviesModel?.totalPages, 10)
    }
    
}
