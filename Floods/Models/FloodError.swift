//
//
// FloodError.swift
// Floods
//
// Created by sinezeleuny on 11.07.2025
//
        

import Foundation

enum FloodError: Error {
    case missingData
}

extension FloodError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard a flood missing data", comment: "")
        }
    }
}
