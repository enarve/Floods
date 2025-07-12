//
//
// TestDownloader.swift
// Floods
//
// Created by sinezeleuny on 12.07.2025
//
        

import Foundation

final class TestDownloader: HTTPDataDownloader {
    
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(for: .milliseconds(.random(in: 100...500)))
        return testPoints
    }
    
}
