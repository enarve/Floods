//
//
// FloodHeightView.swift
// Floods
//
// Created by sinezeleuny on 11.07.2025
//
        

import SwiftUI

struct FloodHeightView: View {
    var flood: Flood
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.black)
            .frame(width: 80, height: 60)
            .overlay {
                Text("\(flood.height.formatted(.number.precision(.fractionLength(1))))")
                    .font(.title)
                    .bold()
                    .foregroundStyle(flood.color)
            }
    }
}
