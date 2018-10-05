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
    static let searchPlaceholder = "Search a Gimmik"
    static let mainStoryboardName = "Main"
}

enum Events {
    static let DataFetched = "DataFetched"
    static let HideKeyBoard = "HideKeyboard"
}

enum Observers {
    static let contentOffset = "contentOffset"
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

enum CustomUIConstants {
    static let gimmikModal = "gimmikModal"
    static let gimmikCell = "gimmikCell"
    static let gimmikCollectionViewCell = "GimmikCollectionViewCell"
}
