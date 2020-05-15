//
//  Preference.swift
//  
//
//  Created by MainasuK Cirno on 2020/3/12.
//

import Foundation

public protocol Preferences: class {
    static var shared: Self { get }
}
