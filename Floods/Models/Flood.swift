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
    let description: String // description
    let latitude: Double
    let longitude: Double
    
    var detail: URL? {
        return URL(string: "https://rtfi.wim.usgs.gov/referencepoints/nwis/\(id)")
    }
}
