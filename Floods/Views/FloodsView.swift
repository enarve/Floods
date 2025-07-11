//
//
// FloodsView.swift
// Floods
//
// Created by sinezeleuny on 10.07.2025
//
        

import SwiftUI

let staticData: [Flood] = [
    Flood(id: "0", height: 0.8,
          place: "Shakey Acres",
          description: "", latitude: 0, longitude: 0),
    Flood(id: "1", height: 2.2,
          place: "Rumble Alley",
          description: "", latitude: 0, longitude: 0)
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
            .onAppear {
                let urlString = "https://rtfi.wim.usgs.gov/referencepoints"
                guard let url = URL(string: urlString) else {
                    print("Url error")
                    return
                }
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data {
                        if let json = try? JSONSerialization.jsonObject(with: data) {
                            print(json)
                        } else {
                            print("Json error")
                        }
                    } else {
                        print("Request error")
                    }
                }.resume()
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
    func deleteFloods(for ids: Set<String>) {
        var offsetsToDelete: IndexSet = []
        for (index, element) in floods.enumerated() {
            if ids.contains(element.id) {
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
