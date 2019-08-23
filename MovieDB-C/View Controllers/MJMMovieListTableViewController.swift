//
//  MJMMovieListTableViewController.swift
//  MovieDB-C
//
//  Created by Mitch Merrell on 8/23/19.
//  Copyright © 2019 Mitch Merrell. All rights reserved.
//

import UIKit

class MJMMovieListTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    private let cellID = "movieCell"
    
    var movies = [MJMMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MJMMovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movie = movie

        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = movieSearchBar.text else { return }
        
        MJMMovieController.fetchMovies(withTitle: searchTerm) { (movies) in
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    }
}
