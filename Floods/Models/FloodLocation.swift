//
//
// FloodLocation.swift
// Floods
//
// Created by sinezeleuny on 12.07.2025
//
        

import Foundation

struct FloodLocation: Decodable {
    var latitude: Double { properties.products.origin.first!.properties.latitude }
    var longitude: Double { properties.products.origin.first!.properties.longitude }
    private var properties: RootProperties
    
    struct RootProperties: Decodable {
        var products: Products
    }
    
    struct Products: Decodable {
        var origin: [Origin]
    }
    
    struct Origin: Decodable {
        var properties: OriginProperties
    }
    
    struct OriginProperties {
        var latitude: Double
        var longitude: Double
    }
}

extension FloodLocation.OriginProperties: Decodable {
    private enum OriginPropertiesCodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: OriginPropertiesCodingKeys.self)
                let longitude = try container.decode(String.self, forKey: .longitude)
                let latitude = try container.decode(String.self, forKey: .latitude)
                guard let longitude = Double(longitude),
                      let latitude = Double(latitude) else { throw FloodError.missingData }
                self.longitude = longitude
                self.latitude = latitude
    }
}
