//
//  NSKeyValueObservation.swift
//  
//
//  Created by MainasuK Cirno on 2020/3/12.
//

import Foundation

extension NSKeyValueObservation {
    public func store(in set: inout Set<NSKeyValueObservation>) {
        set.insert(self)
    }
}
