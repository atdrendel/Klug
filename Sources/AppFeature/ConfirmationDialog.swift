//
//  ConfirmationDialog.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 30/11/2021.
//

import SwiftUI

struct ConfirmationDialog: View {
    @State private var isConfirmationDialog = false
    
    var body: some View {
        VStack {
            Button {
                isConfirmationDialog = true
            } label: {
                Label("Delete", systemImage: "trash.fill")
                
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .tint(.pink)
            .controlSize(.small)
            .confirmationDialog("Are You Sure", isPresented: $isConfirmationDialog, titleVisibility: .visible) {
                Button("Delete", role: .destructive) {
                    print("Item Deleted")
                }
            }
        }
    }
}

struct ConfirmationDialog_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialog()
            .preferredColorScheme(.dark)
    }
}
