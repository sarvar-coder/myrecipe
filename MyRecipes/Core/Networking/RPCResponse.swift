//
//  RPCResponse.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

public struct RPCResponse: APIResponse {
    
    public var response: HTTPURLResponse?
    public var result: Data?
    
    public init(response: HTTPURLResponse? = nil, result: Data? = nil) {
        self.response = response
        self.result = result
    }
}
