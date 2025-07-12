//
//
// FloodsTests.swift
// FloodsTests
//
// Created by sinezeleuny on 12.07.2025
//
        

import Foundation
import Testing
@testable import Floods

struct FloodsTests {

    @Test func geoJSONDecoderDecodesFlood() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let flood = try decoder.decode(Flood.self, from: testPoint_02327500)
        #expect(flood.id == "02327500")
        #expect(flood.height == 3.24)
    }
    
    @Test func geoJSONDecoderDecodesGeoJSON() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(GeoJSON.self, from: testData)
        #expect(decoded.floods.count == 6)
        #expect(decoded.floods[0].id == "01581960")
    }
    
    @Test func floodDetailsDecoder() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(FloodLocation.self, from: testDetail_02207055)
        #expect(decoded.latitude == 19.2189998626709)
    }
    
    @Test func clientDoesFetchFloodData() async throws {
        let downloader = TestDownloader()
        let client = FloodClient(downloader: downloader)
        let floods = try await client.floods
        #expect(floods.count == 6)
    }
}
