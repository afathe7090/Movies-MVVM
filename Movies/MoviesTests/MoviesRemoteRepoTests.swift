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
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
        self.anyCancellable = nil
        self.error = nil
        self.finished = nil
    }
    
    func test_moviesRepoRemote_notHaveError() {
        sut.getMovies(page: 1)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error): self.error = error }
            } receiveValue: { [weak self] movies in
                self?.moviesModel = movies
            }.store(in: &anyCancellable)
        // test data not nil
        XCTAssertNotNil(moviesModel)
        // test data counter
        XCTAssertEqual(moviesModel?.page, 1)
    }
    
}
