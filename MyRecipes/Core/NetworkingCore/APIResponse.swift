//
//  APIResponse.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation
import SwiftyJSON

public protocol APIResponse {
    var response: HTTPURLResponse? { get }
    var result: Data? { get }

    func body(for key: String?) -> Any?
}


extension APIResponse {
    public func body(for key: String?) -> Any? {
        guard let result = result else { return nil }

        let jsonResult = JSON(result)["result"]

        guard jsonResult.exists() else { return nil }

        if let key = key {
            guard jsonResult[key].exists() else {
                return nil
            }
            return jsonResult[key].rawValue
        }

        return jsonResult.rawValue
    }

    public func JSONBody() -> JSON? {
        guard let result = result else {
            return nil
        }
        return JSON(result)["result"]
    }

    public var isHasError: Bool {
        guard let result = result else {
            return false
        }
        return JSON(result)["error"].exists()
    }

    public var error: Error? {
        guard isHasError else {
            return nil
        }

        guard let result = result else {
            return nil
        }

        let json = JSON(result)
        let jsonError = json["error"].stringValue
        let error = NSError(domain: jsonError, code: -1)
        return error
    }
}
