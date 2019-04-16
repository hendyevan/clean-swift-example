//
//  ListMovieTableViewCell.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 05/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import UIKit

protocol MovieTableViewCell {
    
}

protocol MovieSelection {
    func didSelectMovie(_ movie: MovieModel.Movie2)
}

class ListMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieCollectionView: UICollectionView!
    var listMovie: [MovieModel.Movie2] = []
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate : MovieSelection?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(listMovie: [MovieModel.Movie2]){
        self.listMovie = listMovie
        movieCollectionView.reloadData()
    }
}

extension ListMovieTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listMovie.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! MovieCollectionViewCell
        cell.setupCell(movie: listMovie[indexPath.row])
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectMovie(listMovie[indexPath.row])
    }
}
