//
//  MoviesVC.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit

class MoviesVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var movies: [Movie] = Movie.sort(by: \.voteAverage) {
        didSet { }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.request()
        self.collectionView.delegate   = self
        self.collectionView.dataSource = self
    }
    
    fileprivate func request() {
        Network.requests.popular.get(page: 1) { [weak self] movies in
            self?.movies = movies
            self?.collectionView.reloadData()
        }
    }
    
    internal static func show(over vc: UIViewController) {
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! MoviesVC
        vc.present(controller, animated: true)
    }
}

extension MoviesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    // ===================================================== //
    // MARK: - Collection View Delegate & DataSource Methods
    // ===================================================== //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count == .zero ? 20 : movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movie = indexPath.row > movies.count-1 ? nil : movies[indexPath.row]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width    = scrollView.frame.size.width
        let offsetX  = scrollView.contentOffset.x
        let visibles = collectionView.visibles
        
        if let cell  = visibles.first as? MovieCell,
           let index = collectionView.indexPath(for: cell) {
            cell.animate(i: index.row, p: 0.3, x: offsetX, w: width)
        }
        if let cell  = visibles.last as? MovieCell,
           let index = collectionView.indexPath(for: cell) {
            cell.animate(i: index.row, p: 0.3, x: offsetX, w: width)
        }
    }
}

extension MoviesVC: UICollectionViewDelegateFlowLayout {
    // ==================================================== //
    // MARK: - Collection View Flow Layout Delegate Methods
    // ==================================================== //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}



