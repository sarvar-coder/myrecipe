//
//  NetworkingCancelableProtocol.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation

public typealias AFResult<T> = Result<T, Error>

public protocol NetworkingCancelableProtocol: AnyObject {
    func cancelNetworking()
}

public final class NetworkingCancelableBox {
    public var networkingCancelable: NetworkingCancelableProtocol?
    public init() { }
}

public protocol APIManager {
    @discardableResult
    func request(
        with endpoint: Endpoint,
        result: @escaping (AFResult<APIResponse>) -> Void
    ) -> NetworkingCancelableBox?
}
