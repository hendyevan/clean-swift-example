//
//  MovieDescriptionTableViewCell.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 12/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        posterImageView.round(withRadius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(movie: MovieModel.Movie2){
        let _backdropURL = "http://image.tmdb.org/t/p/w780\(movie.backdropPath)"
        let _posterURL = "http://image.tmdb.org/t/p/w780\(movie.posterPath)"
        backdropImageView.kf.setImage(with: URL(string: _backdropURL))
        posterImageView.kf.setImage(with: URL(string: _posterURL))
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.voteAverage)"
        descriptionLabel.text = movie.overview
    }
    
}
