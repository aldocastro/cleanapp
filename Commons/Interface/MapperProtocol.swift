//
//  MapperProtocol.swift
//  Commons
//
//  Created by Castro, Aldo on 03.09.18.
//  Copyright © 2018 Castro, Aldo. All rights reserved.
//

import Foundation
import RxSwift

public protocol MapperProtocol {
    
    associatedtype From
    associatedtype To
    
    func map(from: From) -> To
}
