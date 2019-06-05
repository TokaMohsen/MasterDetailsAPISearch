//
//  MasterViewController.swift
//  MasterDetailsAPISearch
//
//  Created by ToqaMohsen on 6/3/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    var detailViewController: DetailViewController? = nil
    var objects = [movies]()
    var displayedObjects : [Int: [movies]] = [:]
    var numberOfsections = 1
    var hightOfsectionsHeader = 0.0
    var numberOfRowsPerSection = 1
    let sortListObj = SortList()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //navigationItem.leftBarButtonItem = editButtonItem
        
        //  let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        //  navigationItem.rightBarButtonItem = addButton
        
        numberOfRowsPerSection = self.displayedObjects.count
        searchBar.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        
        loadData()
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    @objc
    func insertNewObject(_ sender: Any) {
        // objects.insert(NSDate(), at: 0)
        // let indexPath = IndexPath(row: 0, section: 0)
        //tableView.insertRows(at: [indexPath], with: .automatic)
        //tableView.reloadData()
    }
    
    func loadData() {
        MoviesService.sharedInstance().loadcachedMovies(completionBlock: { (cachedData) in
            if let cachedMovieList = cachedData
            {
                self.objects = cachedMovieList
                self.setupTableViewDataSource(dataSource: [:])
            }
            
            
        })
    }
    
    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = Array(displayedObjects.values)[indexPath.section][indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfsections
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
            else {
                return UITableViewCell()}
        
        let object =  Array(displayedObjects.values)[indexPath.section][indexPath.row]
        
        cell.cellConfigruration(movieTitle: object.title, movieRating: object.rating ?? 0, movieYear: object.year ?? 0, moviePosterPath: "")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(hightOfsectionsHeader)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Array(displayedObjects.values)[section].count
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String (Array(displayedObjects.keys)[section])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func setupTableViewDataSource(dataSource :[Int : [movies]]) {
        self.displayedObjects.removeAll()
        if dataSource.capacity > 0
        {
            self.displayedObjects = dataSource
            hightOfsectionsHeader = 50.0
        }
        else
        {
            self.displayedObjects.updateValue(self.objects, forKey: -1)
            numberOfsections = 1
            hightOfsectionsHeader = 0.0

        }
        self.tableView.reloadData()
    }
}

extension MasterViewController : UISearchBarDelegate
{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""
        {
            setupTableViewDataSource(dataSource: [:])
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let keyWord = searchBar.text
        {
            if let searcResults = MasterPresenter.search(objectResponse: self.objects, title: keyWord)
            {
                numberOfsections = searcResults.count
                displayedObjects = searcResults
                hightOfsectionsHeader = 50.0

                for (key, value) in displayedObjects
                {
                    displayedObjects[key] = value.sorted(by: { $0.rating! > $1.rating! })
                }
                self.tableView.reloadData()
                tableView.tableFooterView = UIView()
            }
        }
        
    }
    
}


