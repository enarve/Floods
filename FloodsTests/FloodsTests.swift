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
        let flood = try decoder.decode(Flood.self, from: testPoint_02327500)
        #expect(flood.id == "02327500")
    }

}
