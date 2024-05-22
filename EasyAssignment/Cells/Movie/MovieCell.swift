//
//  MovieCell.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import SDWebImage
import Foundation

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel:       UILabel!
    @IBOutlet weak var overviewLabel:    UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    internal var movie: Movie? = nil {
        didSet { setInfo() }
    }
    
    fileprivate lazy var noDataView: MovieCellNoDataView = {
        return MovieCellNoDataView.loadNib()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        noDataView.insert(to: self, at: .zero)
    }
    
    fileprivate func stopNoDataView() {
        noDataView.stop()
        sendSubviewToBack(noDataView)
    }
    
    fileprivate func startNoDataView() {
        noDataView.start()
        bringSubviewToFront(noDataView)
    }
    
    internal func animate(i: Int, p: CGFloat, x: CGFloat, w: CGFloat) {
        let x = -p * (x - (w * CGFloat(i)))
        imageScrollView.setContentOffset(.init(x: x, y: 0), animated: false)
    }
    
    fileprivate func setInfo() {
        guard let movie  = movie,
              let poster = movie.posterPath else {
            return startNoDataView()
        }
        setup(poster: poster)
        titleLabel.text       = movie.title
        overviewLabel.text    = movie.overview
        releaseDateLabel.text = movie.releaseDate
        voteAverageLabel.text = "\(movie.voteAverage.rounded(1))"
    }
    
    fileprivate func setup(poster: String) {
        guard let url = "\(Environment.imageBaseUrl())\(poster)".convertToUrl else {
            return startNoDataView()
        }
        if !posterImageView.sd_contains(url) {
            startNoDataView()
            return posterImageView.setImage(url) { [weak self] in self?.stopNoDataView() }
        }
        stopNoDataView()
        posterImageView.setImage(url)
    }
}
