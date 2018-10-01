//
//  MovieRepository.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import RxSwift

public class MovieRepository: MovieRepositoryProtocol {
    
    private var remoteDataSource : MovieRepositoryDataSourceProtocol
    
    public init(remoteDataSource: MovieRepositoryDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func searchMoviesByTitle(_ searchText: String) -> Single<Array<SearchResult>> {
        return remoteDataSource.searchMoviesByTitle(searchText)
    }
}
