import SwiftUI

struct ToolbarStatus: View {
    var isLoading: Bool
    var lastUpdated: TimeInterval
    var floodsCount: Int

    var body: some View {
        VStack {
            if isLoading {
                Text("Checking for Floods...")
                Spacer()
            } else if lastUpdated == Date.distantFuture.timeIntervalSince1970 {
                Spacer()
                Text("\(floodsCount) Floods")
                    .foregroundStyle(Color.secondary)
            } else {
                let lastUpdatedDate = Date(timeIntervalSince1970: lastUpdated)
                Text("Updated \(lastUpdatedDate.formatted(.relative(presentation: .named)))")
                Text("\(floodsCount) Floods")
                    .foregroundStyle(Color.secondary)
            }
        }
        .font(.caption)
    }
}

