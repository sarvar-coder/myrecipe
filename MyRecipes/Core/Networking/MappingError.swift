//
//  MappingError.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

public struct MappingError: LocalizedError {
    public var errorDescription: String? {
        self.failureReason
    }
}
