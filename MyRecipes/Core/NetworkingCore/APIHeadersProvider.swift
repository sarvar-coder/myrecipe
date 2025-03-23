//
//  APIHeadersProvider.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

protocol APIHeadersProvider {
    func headers() -> [String: String]
}
