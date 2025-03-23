//
//  RPCAPIManager.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 23/03/25.
//

import Foundation
import Alamofire

public struct RPCAPIManager: APIManager {
    
    public typealias ReportErrorHandler = (Error) -> Void
    public typealias ParamsBuilder = (RPCEndpoint) -> [String: Any]
    public typealias HeadersBuilder = () -> [String: String]
    public typealias SessionUpdateHandler = (SafeHTTPHeaders) -> Void
    
    private let config: NetworkingConfigProtocol
    private let paramsBuilder: ParamsBuilder
    //    private let headersBuilder: HeadersBuilder
    private let sessionUpdateHandler: SessionUpdateHandler?
    
    private let errorHandlers: [NetworkErrorHandlerProtocol]
    private let reportErrorHandler: ReportErrorHandler
    
    public init(
        config: NetworkingConfigProtocol,
        paramsBuilder: @escaping ParamsBuilder,
        sessionUpdateHandler:  SessionUpdateHandler? = nil,
        errorHandlers: [NetworkErrorHandlerProtocol] = [],
        reportErrorHandler: @escaping ReportErrorHandler) {
        self.config = config
        self.paramsBuilder = paramsBuilder
        self.sessionUpdateHandler = sessionUpdateHandler
        self.errorHandlers = errorHandlers
        self.reportErrorHandler = reportErrorHandler
    }
    
    @discardableResult
    public func request(
        with endpoint: Endpoint,
        result: @escaping (AFResult<APIResponse>) -> Void
    ) -> NetworkingCancelableBox? {
        guard let endpoint = endpoint as? RPCEndpoint else {
            fatalError("Invalid router type")
        }
        
        let endpointURL = config.baseURL(endpoint: endpoint) + endpoint.path
        
        let request = AF.request(
            endpointURL,
            method: HTTPMethod(rawValue: endpoint.method.rawValue),
            parameters: paramsBuilder(endpoint),
            headers: nil
        )
        
        request.validate()
            .responseData { response in
                if let error = response.error {
                    result(.failure(error))
                    reportErrorHandler(error)
                    return
                }
                
                self.updateSession(with: response.response)
                
                switch response.result {
                case .success(let data):
                    let resp = RPCResponse(response: response.response, result: data)
                    if let error = resp.error {
                        self.handle(error: error)
                        result(.failure(error))
                        return
                    }
                    result(.success(resp))
                case .failure(let error):
                    self.handle(error: error)
                    reportErrorHandler(error)
                    result(.failure(error))
                }
            }
        return nil
    }
    
    private func updateSession(with response: HTTPURLResponse?) {
        let safeHTTPHeaders = SafeHTTPHeaders(response)
        sessionUpdateHandler?(safeHTTPHeaders)
    }
    
    private func handle(error: Error) {
        for errorHandler in errorHandlers {
            errorHandler.handle(error)
        }
    }
}
