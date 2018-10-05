//
//  Gimmik.swift
//  GimmikStore
//
//  Created by Dinushanka Nayomal on 10/3/18.
//  Copyright © 2018 Viyana. All rights reserved.
//

import Foundation

struct GimmikResult: Codable {
    var resultCount: Int?
    var results: [Gimmik]?
}

//struct Gimmik: Codable {
//    var id: String?
//    var name: String?
//    var image: String?
//    var description: String?
//    var organization: String?
//}

class Gimmik: Codable {
    var bundleId: String?
    var isGameCenterEnabled: Bool?
    var screenshotUrls: [String?]
    var ipadScreenshotUrls: [String?]
    var appletvScreenshotUrls: [String?]
    var artworkUrl60: String?
    var artworkUrl512: String?
    var artworkUrl100: String?
    var artistViewUrl: String?
    var advisories: [String?]
    var kind: String?
    var features: [String?]
    var supportedDevices: [String?]
    var trackCensoredName: String?
    var languageCodesISO2A: [String?]
    var fileSizeBytes: String?
    var sellerUrl: String?
    var contentAdvisoryRating: String
    var userRatingCountForCurrentVersion: Int?
    var trackViewUrl: String?
    var trackContentRating: String?
    var averageUserRatingForCurrentVersion: Double?
    var formattedPrice: String?
    var version: String?
    var primaryGenreName: String?
    var curreny: String?
    var genres: [String?]
    var sellerName: String?
    var price: Float?
    var description: String?
    var averageUserRating: Float?
    var trackName: String?
    
    func getName() -> String? {
        return self.trackName
    }
    
    func getPrice() -> String {
        return "\(self.formattedPrice)"
    }
    
    func getKind() -> String? {
        return self.kind
    }
    
    func getDescription() -> String? {
        return self.description
    }
    
    func getMaker() -> String {
        return "\(String(describing: self.sellerName ?? "N/A")) ( \(String(describing: getKind() ?? "N/A") )"
    }
    
    func getImageIcon() -> String? {
        return self.artworkUrl512
    }
    
    func getScreenShots() -> [String?] {
        return self.screenshotUrls
    }
    
    func getId() -> String? {
        return self.bundleId
    }
}
