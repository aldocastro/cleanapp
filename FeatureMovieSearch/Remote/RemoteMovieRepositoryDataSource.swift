//
//  RemoteMovieRepositoryDataSource.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public class RemoteMovieRepositoryDataSource: MovieRepositoryDataSourceProtocol {
    
    private var movieApi : TheMovieDatabaseApi
    private var searchResultMapper: SearchResultMapper
    
    public init(movieApi: TheMovieDatabaseApi, searchResultMapper: SearchResultMapper) {
        self.movieApi = movieApi
        self.searchResultMapper = searchResultMapper
    }
    
    public func searchMoviesByTitle(_ searchText: String) -> Single<Array<SearchResult>> {
        let provider = MoyaProvider<TheMovieDatabaseApi>()
        return provider.rx.request(.movie(searchText))
            .map(RemoteSearchResults.self, failsOnEmptyData: false)
            .map{ result -> Array<SearchResult> in
                return result.results.map { item -> SearchResult in
                    return self.searchResultMapper.map(from: item)
                }
            }
    }
}
