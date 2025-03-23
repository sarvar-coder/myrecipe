//
//  JSONMapper.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

public protocol JSONMapper {
    func mapToObject<T: Decodable>(
        from json: Any,
        type: T.Type
    ) throws -> T

    func mapToObject<T: Decodable>(
        from data: Data,
        type: T.Type
    ) throws -> T

    func mapToResult<T: Decodable>(
        from result: Result<APIResponse, Error>,
        for key: String?,
        type: T.Type
    ) -> Result<T, Error>

//    func bool(
//        from result: Result<APIResponse, Error>,
//        forKey key: String
//    ) -> Result<Bool, Error>
//
//    func string(
//        from result: Result<APIResponse, Error>,
//        forKey key: String
//    ) -> Result<String, Error>
}
