//
//  MovieRepositoryProtocol.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import RxSwift

public protocol MovieRepositoryProtocol {
    
     func searchMoviesByTitle(_ searchText: String) -> Single<Array<SearchResult>>
}
