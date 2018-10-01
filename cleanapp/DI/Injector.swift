//
//  Injector.swift
//  Commons
//
//  Created by Aldo Castro on 30.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import FeatureMovieSearch

public class Injector {
    static let shared = Injector()
    
    private(set) var dependencies = [String:Any]()
    
    private init() {
        initMapper()
        initDataSources()
        initRepositories()
        initUseCases()
    }
    
    func initMapper() {
        dependencies["SearchResultMapper"] = SearchResultMapper()
    }
    
    func initDataSources() {
        dependencies["RemoteMovieRepositoryDataSource"] = RemoteMovieRepositoryDataSource(searchResultMapper: dependencies["SearchResultMapper"] as! SearchResultMapper)
    }
    
    func initRepositories() {
        dependencies["MovieRepository"] = MovieRepository(remoteDataSource: dependencies["RemoteMovieRepositoryDataSource"] as! RemoteMovieRepositoryDataSource)
    }
    
    func initUseCases() {
        dependencies["SearchMovieByTitleUseCase"] = SearchMovieByTitleUseCase(repository: dependencies["MovieRepository"] as! MovieRepository)
    }
}
