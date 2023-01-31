//
//  MoviesViewControllerTests.swift
//  MoviesTests
//
//  Created by Ahmed Fathy on 28/01/2023.
//

import Coordinator
import XCTest
@testable import Movies

final class MoviesViewControllerTests: XCTestCase {
    
    func factoryMoviesViewController() throws -> MoviesViewController {
        let router = NavigationRouter(navigationController: UINavigationController())
        let coordinator = MoviesCoordinator(router: router)
        let factoryMovies = MoviesBuilder.moviesBuilder(coordinator: coordinator)
        router.show(factoryMovies, animated: true)
        factoryMovies.loadViewIfNeeded()
        return try XCTUnwrap(factoryMovies as? MoviesViewController)
    }
    
    func test_moviesViewController_ifTitleSets() {
        XCTAssertEqual(try factoryMoviesViewController().title, "Movies")
    }
    
    func test_MoviesViewController_navigationControllerIsLarge() {
        XCTAssertEqual(try factoryMoviesViewController().navigationController?.navigationBar.prefersLargeTitles, true)
    }
  
    func test_moviewViewCOntroller_ifNavigationController_isNil() {
        XCTAssertNotNil(try factoryMoviesViewController().navigationController)
    }
    
    func test_moviesViewControlller_tableViewCell() {
    }
}
