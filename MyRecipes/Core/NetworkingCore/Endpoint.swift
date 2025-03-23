//
//  Endpoint.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public struct SafeHTTPHeaders {
    private let response: HTTPURLResponse?

    public init(_ response: HTTPURLResponse?) {
        self.response = response
    }

    public subscript(caseInsensitive key: String) -> String? {
        response?.value(forHTTPHeaderField: key)
    }
}

public protocol Endpoint { }
