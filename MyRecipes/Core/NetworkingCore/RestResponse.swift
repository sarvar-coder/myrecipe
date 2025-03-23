//
//  RestResponse.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation
import SwiftyJSON

public struct RESTResponse: APIResponse {
    public var response: HTTPURLResponse?
    public var result: Data?
    public init(response: HTTPURLResponse? = nil, result: Data? = nil, error: Error? = nil) {
        self.response = response
        self.result = result
        self.error = error
    }

    public func body(for key: String?) -> Any? {
        guard let result = result else {
            return nil
        }

        if let key = key {
            return JSON(result)["data"][key].rawValue
        }
        return JSON(result)["data"].rawValue
    }

    public func JSONBody() -> JSON? {
        guard let result = result else {
            return nil
        }

        return JSON(result)["data"]
    }

    // TODO: - Add error handle

    public var error: Error?

    public var isHasError: Bool {
        error != nil
    }
}
