import SwiftUI

extension FloodsView {

    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            if editMode == .active {
                SelectButton(mode: $selectMode) {
                    if selectMode.isActive {
                        selection = Set(floods.map { $0.code })
                    } else {
                        selection = []
                    }
                }
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            EditButton(editMode: $editMode) {
                selection.removeAll()
                editMode = .inactive
                selectMode = .inactive
            }
        }
        ToolbarItemGroup(placement: .bottomBar) {
            RefreshButton {
                Task {
                    fetchFloods()
                }
            }
            Spacer()
            ToolbarStatus(
                isLoading: isLoading,
                lastUpdated: lastUpdated,
                floodsCount: floods.count
            )
            Spacer()
            if editMode == .active {
                DeleteButton {
                    deleteFloods(for: selection)
                }
                .disabled(isLoading || selection.isEmpty)
            }
        }
    }
}
