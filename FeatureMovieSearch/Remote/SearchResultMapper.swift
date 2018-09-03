//
//  SearchResultMapper.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import Commons

public class SearchResultMapper: MapperProtocol {
    public typealias From = RemoteSearchResult
    public typealias To = SearchResult
    
    public func map(from: RemoteSearchResult) -> SearchResult {
        return SearchResult(title: from.title)
    }
}
