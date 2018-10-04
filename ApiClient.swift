//
//  ApiClient.swift
//  GimmikStore
//
//  Created by Mayantha Jayawardena on 10/4/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import Foundation
import Almofire

class ApiClient {
    static func search(term: String, entity: String = "software", limit: Int = 2, completion:@escaping (GimmikResult?)->Void) {
        Alamofire.request(ApiRouter.search(term, entity, limit))
            .responseData { response in
                print(response)
                
        }
    }
}
