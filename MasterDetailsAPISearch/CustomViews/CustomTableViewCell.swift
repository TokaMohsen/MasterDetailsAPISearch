//
//  CustomTableViewCell.swift
//  SearchAPIBased
//
//  Created by ToqaMohsen on 6/3/19
//  Copyright © 2019 MeinVodafone. All rights reserved.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    @IBOutlet var movieRating: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!

    @IBOutlet var cellContentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func cellConfigruration(movieTitle : String , movieRating : Int , movieYear : Int , moviePosterPath : String ) {
        self.movieTitle.text = movieTitle
        self.movieRating.text = String(movieRating)
        self.movieYear.text = String(movieYear)
        self.moviePoster.image = UIImage(named: "movie.jpg")
        //self.state = cellState
        self.cellContentView.layer.cornerRadius = 5
    }

}
