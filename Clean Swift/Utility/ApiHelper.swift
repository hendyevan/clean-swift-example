//
//  ApiHelper.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 09/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias Params = [String:Any]

enum APIResult<T> {
    case success(T)
    case failure(NSError)
}

final class APIHelper: NSObject {
    
    typealias CompletionBlock<T> = (APIResult<T>) -> Void
    
    private let baseUrl: String
    private let decoder : JSONDecoder
    
    static let sessionManager: SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "url.com": .pinCertificates(
                certificates: ServerTrustPolicy.certificates(),
                validateCertificateChain: true,
                validateHost: true
            )
        ]
        
        return Alamofire.SessionManager(serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
    }()
    
    init(_ baseUrl: String, _ decoder: JSONDecoder = JSONDecoder()) {
        self.baseUrl = baseUrl
        self.decoder = decoder
    }
    
    func request(_ endPoint: String,
                 parameters: [String: Any]? = nil,
                 encoding: ParameterEncoding = URLEncoding.httpBody,
                 headers: [String: String]? = nil,
                 method: HTTPMethod,
                 callback: @escaping(APIResult<JSON>) -> Void) {
        
        APIHelper.sessionManager.request("\(baseUrl)\(endPoint)", method: method, parameters: parameters, encoding: encoding, headers: headers)
            .responseString { response in
                print("[js] Request String: \(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue)!)")
                if let value = response.result.value {
                    print("[js] Response String: \(value)")
                }
            }
            .responseData { response in
                let objectJson = try? self.decoder.decode(MovieModel.Results.self, from: response.data!)
//                print(objectJson!)
            }
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    callback(.success(JSON(value)))
                    
                case .failure(let error):
                    callback(.failure(error as NSError))
                }
        }
    }
    
    func get(_ endPoint: String,
             parameters: [String: Any]? = nil,
             encoding: ParameterEncoding = URLEncoding.default,
             headers: [String: String]? = nil){
        
        APIHelper.sessionManager.request("\(baseUrl)\(endPoint)", method: .get, parameters: parameters, encoding: encoding, headers: headers)
            .responseString { response in
                print("[js] Request String: \(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue)!)")
                if let value = response.result.value {
                    print("[js] Response String: \(value)")
                }
            }
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    _ = JSON(value)
                    //                        callback(.success(value))
                    
                case .failure(let error):
                    print(error)
                    //                    callback(.failure(error as NSError))
                }
        }
    }
    
    func put(_ endPoint: String,
             parameters: [String: Any]? = nil,
             encoding: ParameterEncoding = URLEncoding.default,
             headers: [String: String]? = nil){
        
        APIHelper.sessionManager.request("\(baseUrl)\(endPoint)", method: .put, parameters: parameters, encoding: encoding, headers: headers)
            .responseString { response in
                print("[js] Request String: \(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue)!)")
                if let value = response.result.value {
                    print("[js] Response String: \(value)")
                }
            }
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    _ = JSON(value)
                    //                        callback(.success(value))
                    
                case .failure(let error):
                    print(error)
                    //                    callback(.failure(error as NSError))
                }
        }
    }
    
    func delete(_ endPoint: String,
                parameters: [String: Any]? = nil,
                encoding: ParameterEncoding = URLEncoding.default,
                headers: [String: String]? = nil){
        
        APIHelper.sessionManager.request("\(baseUrl)\(endPoint)", method: .delete, parameters: parameters, encoding: encoding, headers: headers)
            .responseString { response in
                print("[js] Request String: \(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue)!)")
                if let value = response.result.value {
                    print("[js] Response String: \(value)")
                }
            }
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    _ = JSON(value)
                    //                        callback(.success(value))
                    
                case .failure(let error):
                    print(error)
                    //                    callback(.failure(error as NSError))
                }
        }
    }
    
    
    func call<T>(_ endPoint: String,
                 parameters: [String: Any]? = nil,
                 encoding: ParameterEncoding = URLEncoding.httpBody,
                 headers: [String: String]? = nil,
                 method: HTTPMethod,
                 handler: @escaping CompletionBlock<T>) where T: Codable {
        
        APIHelper.sessionManager.request(endPoint,
                                         method: method,
                                         parameters: parameters,
                                         encoding: encoding,
                                         headers: headers).validate().responseJSON { (data) in
                                            do {
                                                guard let jsonData = data.data else {
                                                    //throw AlertMessage(title: "Error", body: "No data")
                                                    return
                                                }
                                                let result = try JSONDecoder().decode(T.self, from: jsonData)
                                                handler(.success(result))
                                            } catch {
                                                handler(.failure(NSError()))
                                            }
        }
    }
}
