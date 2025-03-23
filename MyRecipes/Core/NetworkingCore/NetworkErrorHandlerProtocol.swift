//
//  NetworkErrorHandlerProtocol.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

public protocol NetworkErrorHandlerProtocol {
    func handle(_ error: Error)
}
