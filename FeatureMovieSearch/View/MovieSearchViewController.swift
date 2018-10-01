//
//  MovieSearchViewController.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import UIKit

public class FeatureMovieSearchViewControllerFactory {
    
    public static func create(searchMovieByTitleUseCase: SearchMovieByTitleUseCase) -> MovieSearchViewController {
        return MovieSearchViewController(searchMovieByTitleUseCase: searchMovieByTitleUseCase)
    }
}

public protocol MovieSearchView {
    func displayMovies(_ results: [SearchResult])
    func displayErrorView()
}

public class MovieSearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var results: [SearchResult] = []
    fileprivate var presenter: MovieSearchPresenter!
    
    enum Constants: String {
        case nibName = "MovieSearchView"
    }
    
    public required convenience init(searchMovieByTitleUseCase: SearchMovieByTitleUseCase) {
        self.init()
        self.presenter = MovieSearchPresenter(view: self, searchMovieByTitleUseCase: searchMovieByTitleUseCase)
    }

    private init() {
        super.init(nibName: Constants.nibName.rawValue, bundle: Bundle(for: type(of: self)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    deinit {
        presenter.tearDown()
    }
    
    public override func viewDidLoad() {
        tableView.register(MovieSearchResultCell.self, forCellReuseIdentifier: MovieSearchResultCell.kCellIdentifier)
        tableView.dataSource = self
    }
}

extension MovieSearchViewController : UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.onSearchTextChanged(searchText)
    }
}

extension MovieSearchViewController: MovieSearchView {
    public func displayMovies(_ results: [SearchResult]) {
        self.results = results
        self.tableView.reloadData()
    }
    public func displayErrorView() {
        //todo: display error view
    }
}

extension MovieSearchViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieSearchResultCell.kCellIdentifier, for: indexPath)
        cell.textLabel?.text = results[indexPath.row].title
        return cell
    }
}
