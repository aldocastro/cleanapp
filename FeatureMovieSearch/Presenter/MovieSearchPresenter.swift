//
//  MovieSearchPresenter.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import UIKit

public class MovieSearchPresenterFactory {
    static func create() -> MovieSearchPresenter {
        return MovieSearchPresenter()
    }
}

public class MovieSearchPresenter: NSObject {
    
    public func onSearchTextChanged(_ text: String) {
//        searchMovieByTitleUseCase.execute(text)
        // TODO: rxify
    }
}
