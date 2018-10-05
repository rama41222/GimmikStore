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
            return "/search?term=\(term)&entity=\(entity)&limit=\(limit)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseUrl = Config.BaseUrl
        let url = URL(string: baseUrl.appending(location).removingPercentEncoding ?? Config.generalUrl)
        var request = URLRequest(url: url!)
        
        request.httpMethod = method.rawValue
        request.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        request.timeoutInterval = TimeInterval(10 * 1000)
        return try URLEncoding.default.encode(request, with: nil)
        
    }

}
