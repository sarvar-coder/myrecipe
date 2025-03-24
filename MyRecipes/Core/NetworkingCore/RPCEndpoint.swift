//
//  RPCEndpoint.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation
import Alamofire

public protocol RPCEndpoint: Endpoint {
    
    var path: String { get }
    
    var method: RPCHTTPMethod { get }
    var parameters: [String: Any]? { get }
    
    var headers: HTTPHeaders? { get }
    var encoding: Alamofire.ParameterEncoding { get }
}

extension RPCEndpoint {
    
    public var encoding: Alamofire.ParameterEncoding { URLEncoding.default }
    
    public var headers: HTTPHeaders? { nil }
    
    public var parameters: [String: Any]? { nil }
}
