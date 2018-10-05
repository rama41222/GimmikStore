//
//  Constants.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import Foundation
import UIKit

enum Config {
    static let BaseUrl = "https://itunes.apple.com"
    static let appTitle = "Gimmik Store"
    static let generalUrl = "https://itunes.apple.com/search?term=google&entity=software&limit=1"
}

enum Colors {
    static let appHeaderColor = UIColor(red: 72/255.0, green: 52/255.0, blue: 212/255.0, alpha: 1.0)
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}
