//
//  SearchMovieByTitleUseCase.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import Commons
import RxSwift

public class SearchMovieByTitleUseCase : UseCaseProtocol {
    public typealias Input = Params
    public typealias Output = Single<Array<SearchResult>>
    
    private var repository : MovieRepositoryProtocol
    
    init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(params: Params) -> Single<Array<SearchResult>> {
        return repository.searchMoviesByTitle(params.searchText)
    }
    
    public struct Params {
        var searchText: String
    }
}
