//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import Foundation
import Combine
protocol MoviesViewModelProtocol: AnyObject {
    var input: MoviesViewModel.Input { get }
    var output: MoviesViewModel.Output { get }
    func viewDidLoad()
}
final class MoviesViewModel: ObservableObject, MoviesViewModelProtocol, ViewModel {
    // MARK: - Properties
    private let useCase: MoviesUseCaseProtocol
    private(set) var input: Input  = .init()
    private(set) var output: Output = .init()
    private var anyCancellable = Set<AnyCancellable>()
    @Published var movies: [MovieModelData] = []
    private var currentPage: Int = 1
    private var allPagesCount: Int = 0
    // MARK: - Init
    init(useCase: MoviesUseCaseProtocol) {
        self.useCase = useCase
    }
    class Input {}
    class Output {
        @Published var moviesViewModel: MovieSectionViewModel?
        @Published var didSelectMoviePublisher: MovieModelData?
    }
    // MARK: - ViewDidLoad
    func viewDidLoad() {
        fetchMovies()
        configureMoviesViewModel()
        setupDidSelect()
        configurePaginationWhileScrolling()
    }
    // MARK: - Public Functions
    func fetchMovies(_ page: Int = 1) {
        useCase.getMovies(page: page)
            .sink { error in
                print(error)
            } receiveValue: { [weak self] movieModel in
                guard let self = self else {return}
                self.currentPage = movieModel.page!
                self.allPagesCount = movieModel.totalPages!
                self.movies.append(contentsOf: movieModel.results!)
            }.store(in: &anyCancellable)
        
    }
    func configureMoviesViewModel() {
        $movies.sink { dataModel in
            self.output.moviesViewModel = .init(movies: dataModel)
        }.store(in: &anyCancellable)
    }
    func setupDidSelect() {
        output.$moviesViewModel
            .flatMap({
                $0!.$didSelectPublisher
            }).filter({$0 != nil})
            .assign(to: &output.$didSelectMoviePublisher)
    }
    func configurePaginationWhileScrolling() {
        output.$moviesViewModel
            .flatMap({
                $0!.$didScrollCell
            }).compactMap({$0})
            .sink { [weak self] _ in
                guard let self = self else {return}
                if self.currentPage == self.allPagesCount { return }
                if self.currentPage < self.allPagesCount {
                    self.currentPage += 1
                    self.fetchMovies(self.currentPage)
                }
            }.store(in: &anyCancellable)
    }
}
