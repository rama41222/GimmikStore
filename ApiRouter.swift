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
    
    
}
