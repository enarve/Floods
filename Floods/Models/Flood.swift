//
//
// Flood.swift
// Floods
//
// Created by sinezeleuny on 11.07.2025
//
        

import Foundation

struct Flood {
    let height: Double
    let place: String
    let time: Date
    let code: String
    let detail: URL
}

extension Flood: Identifiable {
    var id: String { code }
}
