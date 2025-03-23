//
//  JSONMapperImp.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

final class JSONMapperImp: JSONMapper {
    
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
        self.decoder.dateDecodingStrategy = .millisecondsSince1970
    }
    
    func mapToObject<T>(from json: Any, type: T.Type) throws -> T where T : Decodable {
        guard !(json is NSNull) else { throw MappingError() }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let object = try mapToObject(from: jsonData, type: type)
            return object
        } catch {
            print(error.localizedDescription)
        }
        throw MappingError()
    }
    
    func mapToObject<T>(from data: Data, type: T.Type) throws -> T where T : Decodable {
        var errorText = ""
        
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch let DecodingError.dataCorrupted(context) {
            errorText = context.debugDescription
        } catch let DecodingError.keyNotFound(key, context) {
            let keyPath = (context.codingPath + [key]).map { $0.stringValue }.joined(separator: ".")
            errorText = "Key '\(key.stringValue)' not found at path: \(keyPath)|"
        } catch let DecodingError.typeMismatch(type, context) {
            errorText = "\(type) was expected, \(context.debugDescription) | \(context.codingPath)"
        } catch let DecodingError.valueNotFound(type, context) {
            errorText = "no value was found for \(type), \(context.debugDescription)"
        } catch {
            errorText = "Unknown error"
        }
        
        debugPrint(errorText)
        throw MappingError()
    }
    
    func mapToResult<T>(
        from result: Result<APIResponse, Error>,
        for key: String?, 
        type: T.Type)
    -> Result<T, Error> where T : Decodable {
        switch result {
        case .success(let success):
            guard let result = success.result else { return Result.failure(MappingError()) }

            do {
                let object = try mapToObject(from: result, type: type)
                return Result.success(object)
            } catch {
                return Result.failure(error)
            }
        case .failure(let failure):
            return Result.failure(failure)
        }
    }
}
