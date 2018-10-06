//
//  ApiRouter.swift
//  GimmikStore
//
//  Created by Mayantha Jayawardena on 10/4/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import Foundation
import Alamofire

enum ApiRouter: URLRequestConvertible {
    
    case search(String, String, Int)
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var location: String {
        switch self {
        case .search(let term, let entity, let limit):
            return "/search?term=\(encode(term))&entity=\(entity)&limit=\(limit)"
        }
    }
    
    func encode(_ term: String) -> String {
        let escapedAddress = term.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        return escapedAddress ?? ""
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseUrl = Config.BaseUrl
        let url = URL(string: baseUrl.appending(location))
        var request = URLRequest(url: url ?? URL(string: Config.generalUrl)!)
        
        request.httpMethod = method.rawValue
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        request.timeoutInterval = TimeInterval(10 * 1000)
        print(request)
        print(try URLEncoding.default.encode(request, with: nil))
        return try URLEncoding.default.encode(request, with: nil)
        
    }

}
