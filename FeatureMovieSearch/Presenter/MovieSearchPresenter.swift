//
//  MovieSearchPresenter.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import UIKit
import RxSwift

public class MovieSearchPresenterFactory {
    static func create(view: MovieSearchView, searchMovieByTitleUseCase: SearchMovieByTitleUseCase) -> MovieSearchPresenter {
        return MovieSearchPresenter(view: view, searchMovieByTitleUseCase: searchMovieByTitleUseCase)
    }
}

public class MovieSearchPresenter {
    
    private let view: MovieSearchView
    private let searchMovieByTitleUseCase: SearchMovieByTitleUseCase
    private let disposables: CompositeDisposable
    
    public init(view: MovieSearchView, searchMovieByTitleUseCase: SearchMovieByTitleUseCase) {
        self.view = view
        self.searchMovieByTitleUseCase = searchMovieByTitleUseCase
        self.disposables = CompositeDisposable()
    }
    
    public func onSearchTextChanged(_ text: String) {
        let useCase = searchMovieByTitleUseCase
            .execute(params: SearchMovieByTitleUseCase.Params(searchText: text))
            .subscribe(
                onSuccess: { searchResult in
                    self.view.displayMovies(searchResult)
                },
                onError: { error in
                    self.view.displayErrorView()
                }
        )
        _ = disposables.insert(useCase)
    }
    
    public func tearDown() {
        disposables.dispose()
    }
}
