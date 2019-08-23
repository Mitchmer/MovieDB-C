//
//  MJMMovieTableViewCell.swift
//  MovieDB-C
//
//  Created by Mitch Merrell on 8/23/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

import UIKit

class MJMMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movie: MJMMovie? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        ratingLabel.text = String(movie.rating.doubleValue)
        descriptionLabel.text = movie.movieDescription
    }

}
