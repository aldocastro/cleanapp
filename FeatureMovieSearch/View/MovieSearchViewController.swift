//
//  MovieSearchViewController.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import UIKit

public class FeatureMovieSearchViewControllerFactory {
    
    public static func create() -> MovieSearchViewController {
        let presenter = MovieSearchPresenterFactory.create()
        return MovieSearchViewController(presenter: presenter)
    }
}

public class MovieSearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var presenter: MovieSearchPresenter!
    
    enum Constants: String {
        case nibName = "MovieSearchView"
    }
    
    public required convenience init(presenter: MovieSearchPresenter) {
        self.init()
        self.presenter = presenter
    }

    private init() {
        super.init(nibName: Constants.nibName.rawValue, bundle: Bundle(for: type(of: self)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
}

extension MovieSearchViewController : UISearchBarDelegate {
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.onSearchTextChanged(searchText)
    }
}
