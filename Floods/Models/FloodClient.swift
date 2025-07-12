//
//
// FloodClient.swift
// Floods
//
// Created by sinezeleuny on 12.07.2025
//
        

import Foundation

struct FloodClient {
    
    var floods: [Flood] {
        get async throws {
            let data = try await downloader.httpData(from: feedURL)
            let allFloods = try decoder.decode([Flood].self, from: data)
            return allFloods
        }
    }
    
    private var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()
    
    private let feedURL = URL(string: "https://rtfi.wim.usgs.gov/referencepoints")!
    
    private let downloader: any HTTPDataDownloader
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
    
}
