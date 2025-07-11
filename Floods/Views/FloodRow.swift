//
//
// FloodRow.swift
// Floods
//
// Created by sinezeleuny on 11.07.2025
//
        

import SwiftUI

struct FloodRow: View {
    var flood: Flood
    
    var body: some View {
        HStack {
            FloodHeightView(flood: flood)
            VStack(alignment: .leading) {
                Text(flood.place)
                    .font(.title3)
                Text("\(flood.description)")
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}

