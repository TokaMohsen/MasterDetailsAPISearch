//
//  DetailViewController.swift
//  MasterDetailsAPISearch
//
//  Created by ToqaMohsen on 6/3/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
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
        collectionView.register(UINib(nibName: "customCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imgCell")
        collectionView.delegate = self
        collectionView.dataSource = self
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
       
       
     self.AlertViewWithLoadingIndicator()

        FlickerAPISearch.fetchPhotosForSearchText(searchText: searchText, onCompletion: { (error: NSError?, flickrPhotos: [FlickerPicResponse]?) -> Void in
            if error == nil {
               
                self.photos = flickrPhotos!
                self.collectionView.reloadData()


            } else {
                self.photos = []
                if (error!.code == FlickerAPISearch.Errors.invalidAccessErrorCode) {
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.showErrorAlert()
                    })
                }
            }

        })

    }
    private func showErrorAlert() {
        let alertController = UIAlertController(title: "Search Error", message: "Invalid API Key", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func AlertViewWithLoadingIndicator()
    {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
   
}


extension DetailViewController : UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imgCell", for: indexPath)  as? customCollectionViewCell
        else {
            return UICollectionViewCell()
            
        }
        var flickrPhoto : FlickerPicResponse?
        flickrPhoto = self.photos[indexPath.row]

        SDWebImageManager.shared().imageDownloader?.downloadImage(with: flickrPhoto?.photoUrl as URL!, options: .continueInBackground, progress: nil, completed: {
            (image:UIImage?, data:Data?, error:Error?, finished:Bool) in
            if image != nil {
                cell.imgView.image = image
            }
        })
      
        if ((self.navigationController?.visibleViewController?.isKind(of: UIAlertController.self))!){
            self.dismiss(animated: false, completion: nil)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
}

