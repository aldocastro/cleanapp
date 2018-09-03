//
//  UseCase.swift
//  Commons
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import RxSwift

public protocol UseCase {
    
    associatedtype Input
    associatedtype Output
    
    func execute(params: Input) -> Output
}
