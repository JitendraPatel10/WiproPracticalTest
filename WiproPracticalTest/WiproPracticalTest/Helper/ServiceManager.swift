//
//  ServiceManager.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import Foundation
import Alamofire

///Completion Handle For API Response
typealias completionHandler<T: Codable> = (Result<T, CustomError>) -> Void

final class ServiceManager {
    
    static let shared = ServiceManager()
    
    func makeRequest<T: Codable>(
        endPointType: EndPointTypes,
        completion: @escaping completionHandler<T>
    ) {
        
        guard let isReachable = NetworkReachabilityManager()?.isReachable, isReachable  else {
            
            completion(.failure(.error("Check your Internet connection.")))
            return
        }
        
        guard let url = endPointType.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(
            url,
            method: endPointType.method,
            parameters: endPointType.body,
            encoding: JSONEncoding.default,
            headers: endPointType.headers
        ).responseData { afResponse in
            
            switch afResponse.result {
            case .success:
                if let _ = afResponse.error {
                    completion(.failure(.inValidResponseData))
                }
                
                guard let data = afResponse.data else {
                    completion(.failure(.inValidResponseData))
                    return
                }
                do{
                    
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    
                    completion(.failure(.error(error.localizedDescription)))
                }
                
            case .failure(_):
                completion(.failure(.invalidURL))
            }
        }
        
        
    }
    
    static var commonHeaders: HTTPHeaders {
        return [
            "Content-Type": "application/json"
        ]
    }
}
