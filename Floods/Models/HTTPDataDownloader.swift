//
//
// HTTPDataDownloader.swift
// Floods
//
// Created by sinezeleuny on 12.07.2025
//
        

import Foundation

let validStatus = 200...299

protocol HTTPDataDownloader: Sendable {
    func httpData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url) as? (Data, HTTPURLResponse) else {
            throw FloodError.networkError
        }
        return data
    }
}
