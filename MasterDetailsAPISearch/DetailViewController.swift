//
//  DetailViewController.swift
//  MasterDetailsAPISearch
//
//  Created by ToqaMohsen on 6/3/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imagesCollectionView: UICollectionView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet var DetailRatingLabel: UILabel!
    
    @IBOutlet var detailGenresLabel: UILabel!
    @IBOutlet var detailYearLabel: UILabel!
    @IBOutlet var detailCastLabel: UILabel!
    
    func configureView() {
        // Update the user interface for the detail item.
       if let detail = detailItem {
       // self.detailDescriptionLabel.text = "title"
         let f = detail.title
//        self.detailYearLabel.text?.append(contentsOf: String(detail.year!))
//        self.DetailRatingLabel.text?.append(contentsOf: String(detail.rating!))
        let y = detail.genres![0]
        //self.detailGenresLabel.text? = detail.genres![0]
        //self.detailCastLabel.text? = detail.cast![0]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: movies? {
        didSet {
            // Update the view.
            configureView()
        }
    }
   
}
extension DetailViewController : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! collectionCell
        let image = myImages[indexPath.row]
        cell.imageView.image = image
        return cell
    }
}
