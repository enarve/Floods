//
//
// Flood+Color.swift
// Floods
//
// Created by sinezeleuny on 11.07.2025
//
        

import SwiftUI

extension Flood {
    /// The color which corresponds with the flood's gauge height
    var color: Color {
        switch height {
        case 0..<1:
            return .green
        case 1..<5:
            return .yellow
        case 5..<7:
            return .orange
        case 7..<Double.greatestFiniteMagnitude:
            return .init(red: 0.8, green: 0.2, blue: 0.7)
        default:
            return .gray
        }
    }
}
