//
//  RemoteSearchResults.swift
//  FeatureMovieSearch
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation

public struct RemoteSearchResults: Decodable {
    var results: Array<RemoteSearchResult>
}

public struct RemoteSearchResult: Decodable {
    var title: String
}
