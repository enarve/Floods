//
//
// Flood.swift
// Floods
//
// Created by sinezeleuny on 11.07.2025
//
        

import Foundation

struct Flood: Identifiable {
    let id: String // nwis_id
    let height: Double // gage_height
    let place: String // site_name
    let description: String? // description
    let latitude: Double
    let longitude: Double
    
    var detail: URL? {
        return URL(string: "https://rtfi.wim.usgs.gov/referencepoints/nwis/\(id)")
    }
}

extension Flood: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "nwis_id"
        case height = "gage_height"
        case place = "site_name"
        case description
        case latitude
        case longitude
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rawId = try? container.decode(String.self, forKey: .id)
        let rawHeight = try? container.decode(Double.self, forKey: .height)
        let rawPlace = try? container.decode(String.self, forKey: .place)
        let rawDescription = try? container.decode(String?.self, forKey: .description)
        let rawLatitude = try? container.decode(Double.self, forKey: .latitude)
        let rawLongitude = try? container.decode(Double.self, forKey: .longitude)
        guard let id = rawId, let height = rawHeight, let place = rawPlace, let latitude = rawLatitude, let longitude = rawLongitude else {
            throw FloodError.missingData
        }
        self.id = id
        self.height = height
        self.place = place
        self.description = rawDescription
        self.latitude = latitude
        self.longitude = longitude
    }
}
