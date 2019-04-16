//
//  MovieCollectionViewCell.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 05/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moviePosterImageView.round(withRadius: 10)
    }
    
    func setupCell(movie: MovieModel.Movie2){
        movieTitleLabel.text = movie.title
        
        let _imageURL = "http://image.tmdb.org/t/p/w780\(movie.posterPath)"
        moviePosterImageView.kf.setImage(with: URL(string: _imageURL))
    }

}
