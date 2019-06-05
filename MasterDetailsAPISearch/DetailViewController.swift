//
//  DetailViewController.swift
//  MasterDetailsAPISearch
//
//  Created by ToqaMohsen on 6/3/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var detailRatingLabel: UILabel!
    @IBOutlet var detailGenresLabel: UILabel!
    @IBOutlet var detailCastLabel: UILabel!
    @IBOutlet var detailYearLabel: UILabel!
    @IBOutlet var detailDescriptionLabel: UILabel!
    var photos: [FlickerPicResponse] = []
    
    func configureView() {
        // Update the user interface for the detail item.
       if detailItem != nil {
        performSearchWithText(searchText: detailItem!.title!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        if detailItem != nil
        {
            self.detailDescriptionLabel.text = detailItem!.title
            self.detailYearLabel.text!.append(contentsOf: String(detailItem!.year!))
            self.detailRatingLabel.text!.append(contentsOf: String(detailItem!.rating!))
            self.detailGenresLabel.text?.append(String((detailItem!.genres?.joined(separator: " , "))!))
            self.detailCastLabel.text?.append((detailItem!.cast?.joined(separator: " , "))!)
        }
    }

    var detailItem: movies? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    // MARK: - Private
    
    private func performSearchWithText(searchText: String) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        FlickerAPISearch.fetchPhotosForSearchText(searchText: searchText, onCompletion: { (error: NSError?, flickrPhotos: [FlickerPicResponse]?) -> Void in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if error == nil {
                self.photos = flickrPhotos!
            } else {
                self.photos = []
                if (error!.code == FlickerAPISearch.Errors.invalidAccessErrorCode) {
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.showErrorAlert()
                    })
                }
            }
//            DispatchQueue.main.async(execute: { () -> Void in
//                self.title = searchText
//                self.tableView.reloadData()
//            })
        })
    }
    
    private func showErrorAlert() {
        let alertController = UIAlertController(title: "Search Error", message: "Invalid API Key", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
    }
   
}
extension DetailViewController : UICollectionViewDelegate
{
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! collectionCell
//        let image = myImages[indexPath.row]
  //  photoImageView.sd_setImage(with: flickrPhoto!.photoUrl as URL!)
//        cell.imageView.image = image
//        return cell
//    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // you can return as per your requirement
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
}
