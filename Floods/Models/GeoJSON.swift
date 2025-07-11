//
//
// GeoJSON.swift
// Floods
//
// Created by sinezeleuny on 12.07.2025
//
        

import Foundation

struct GeoJSON: Decodable {
    private(set) var floods: [Flood] = []
    
    private enum RootCodingKeys: String, CodingKey {
        case features
    }
    private enum FeatureCodingKeys: String, CodingKey {
        case properties
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        var featuresContainer = try rootContainer.nestedUnkeyedContainer(forKey: .features)
        
        while !featuresContainer.isAtEnd {
            let propertiesContainer = try featuresContainer.nestedContainer(keyedBy: FeatureCodingKeys.self)
            
            if let properties = try? propertiesContainer.decode(Flood.self, forKey: .properties) {
                floods.append(properties)
            }
        }
        
    }
}
