//
//  MovieCell.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import UIKit
import Kingfisher
class MovieCell: UITableViewCell {

    // MARK: - Oulets
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblMovieOverview: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    private func configure() {
        imgMovie.cornerRadius(radius: 10)
        imgMovie.staticShadow(with: 2)
    }
    func setCell(viewModel: MovieModelData) {
        lblMovieName.text = viewModel.title
        lblMovieOverview.text = viewModel.overview
        
        let sourceURL = URL(string: "https://image.tmdb.org/t/p/original\(viewModel.posterPath!)" )
        imgMovie.kf.indicatorType = .activity
        imgMovie.kf.setImage(with: sourceURL, options: [.transition(.fade(0.8))])
    }
}
