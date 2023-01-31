//
//  MoviesViewController.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import UIKit
import Combine
class MoviesViewController: UIViewController, NibBased {
    // MARK: - Properties
    private weak var coordinator: MoviesCoordinatorPresentable?
    private let viewModel: MoviesViewModelProtocol
    private var adapter: MovieSectionDatasource?
    private var anyCancellable = Set<AnyCancellable>()
    // MARK: - Outlet
    @IBOutlet weak var movieTableView: UITableView!
    
    // MARK: - Init
    required init(viewModel: MoviesViewModelProtocol, coordinator: MoviesCoordinatorPresentable?) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: MoviesViewController.nibName, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    // MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        configureTableView()
        setupNavigationView()
        configureDatasource()
        didSelectCell()
    }
    func configureTableView() {
        movieTableView.registerNib(cell: MovieCell.self)
    }
    func setupNavigationView() {
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func configureDatasource() {
        viewModel.output
            .$moviesViewModel
            .sink { [weak self] moviesViewModel in
                guard let self = self, let moviesViewModel = moviesViewModel else {return}
                self.configureAdapterDatasource(moviesViewModel)
            }.store(in: &anyCancellable)
    }
    func configureAdapterDatasource(_ sectionViewModel: MovieSectionViewModel) {
        adapter = MovieSectionDatasource(viewModel: sectionViewModel)
        movieTableView.delegate = adapter
        movieTableView.dataSource = adapter
        movieTableView.reloadData()
    }
    func didSelectCell() {
        viewModel.output
            .$didSelectMoviePublisher
            .compactMap({$0})
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] movie in
                self.coordinator?.movieDetail(movie)
            }.store(in: &anyCancellable)
    }
}
