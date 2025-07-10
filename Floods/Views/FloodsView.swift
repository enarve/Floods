//
//
// FloodsView.swift
// Floods
//
// Created by sinezeleuny on 10.07.2025
//
        

import SwiftUI

let staticData: [Flood] = [
    Flood(height: 0.8,
          place: "Shakey Acres",
          time: Date(timeIntervalSinceNow: -1000),
          code: "nc73649170",
          detail: URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73649170.geojson")!),
    Flood(height: 2.2,
          place: "Rumble Alley",
          time: Date(timeIntervalSinceNow: -5000),
          code: "hv72783692",
          detail: URL(string: "https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/hv72783692")!)
    ]

struct FloodsView: View {
    
    @AppStorage("lastUpdated")
    var lastUpdated = Date.distantFuture.timeIntervalSince1970
    
    @State var floods: [Flood] = staticData
    @State var editMode: EditMode = .inactive
    @State var selectMode: SelectMode = .inactive
    @State var isLoading = false
    @State var selection: Set<String> = []
    
    var body: some View {
        NavigationView {
            List(selection: $selection) {
                ForEach(floods) { flood in
                    FloodRow(flood: flood)
                }
                .onDelete(perform: deleteFloods)
            }
            .listStyle(.inset)
            .navigationTitle(title)
            .toolbar(content: toolbarContent)
            .environment(\.editMode, $editMode)
            .refreshable {
                fetchFloods()
            }
        }
    }
}

extension FloodsView {
    var title: String {
        if selectMode.isActive || selection.isEmpty {
            return "Floods"
        } else {
            return "\(selection.count) Selected"
        }
    }
    func deleteFloods(at offsets: IndexSet) {
        floods.remove(atOffsets: offsets)
    }
    func deleteFloods(for codes: Set<String>) {
        var offsetsToDelete: IndexSet = []
        for (index, element) in floods.enumerated() {
            if codes.contains(element.code) {
                offsetsToDelete.insert(index)
            }
        }
        deleteFloods(at: offsetsToDelete)
        selection.removeAll()
    }
    func fetchFloods() {
        isLoading = true
        self.floods = staticData
        lastUpdated = Date().timeIntervalSince1970
        isLoading = false
    }
}

#Preview {
    FloodsView()
}
