//
//  MovieSectionDatasource.swift
//  Movies
//
//  Created by Ahmed Fathy on 22/01/2023.
//

import UIKit
final class MovieSectionDatasource: NSObject, UITableViewDelegate, UITableViewDataSource {
    private let viewModel: MovieSectionViewModel
    init(viewModel: MovieSectionViewModel) {
        self.viewModel = viewModel
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(cell: MovieCell.self, indexPath: indexPath)
        cell.setCell(viewModel: viewModel.dataSource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectPublisher = viewModel.dataSource[indexPath.row]
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        viewModel.didScrollCell = {}()
    }
}
