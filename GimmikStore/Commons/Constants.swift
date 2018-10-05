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
    static let generalUrl = "https://itunes.apple.com/search?term=top&entity=software&limit=200"
}

enum Colors {
    static let appHeaderColor = UIColor(red: 237/255.0, green: 76/255.0, blue: 103/255.0, alpha: 1.0)
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}
