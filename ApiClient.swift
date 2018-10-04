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
                guard response.result.isSuccess,
                    let value = response.result.value else {
                        print("Error while fetching Apps: \(String(describing: response.result.error))")
                        completion(nil)
                        return
                }
                do {
                    let gimmikApps = try JSONDecoder().decode(GimmikResult.self, from: value)
                    completion(gimmikApps)
                } catch let error {
                    print("Error while fetching Apps, JSON Parsing error: \(error)")
                    completion(nil)
                }
        }
    }
}
