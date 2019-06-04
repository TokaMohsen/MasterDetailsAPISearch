//
//  CustomTableViewCell.swift
//  SearchAPIBased
//
//  Created by ToqaMohsen on 6/3/19
//  Copyright © 2019 MeinVodafone. All rights reserved.
//

import UIKit


enum Status: String {
    case collapsed
    case expanded
}

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var movieRating: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
   // var state: ItemStatus? = .collapsed

//    var expandState : Bool = false
//    {
//        didSet
//        {
////            if expandState == true
////            {
//                self.showMoreClosure()
//            //}
//        }
//    }
   // var showMoreClosure :(() -> ())!
//    @IBAction func showMoreAction(_ sender: UIButton) {
//        
//        expandState = !expandState
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfigruration(movieTitle : String , movieRating : Int , movieYear : Int , moviePosterPath : String ) {
        self.movieTitle.text = movieTitle
        self.movieRating.text = String(movieRating)
        self.movieYear.text = String(movieYear)
        self.moviePoster.image = UIImage(named: "movie.jpg")
        //self.state = cellState
    }

}
