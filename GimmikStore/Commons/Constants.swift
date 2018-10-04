//
//  Constants.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import Foundation

enum Config {
    static let BaseUrl = "https://itunes.apple.com"
    static let appTitle = "GimmikStore"
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}
