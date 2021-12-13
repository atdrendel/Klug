//
//  AccountView.swift
//  KlugDesign
//
//  Created by Evans Domina Attafuah on 13/12/2021.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            List {
                
                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                    .symbolVariant(.circle.fill)
                    .font(.system(size: 32))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.blue, .blue.opacity(0.3))
                    .padding()
                    .background(Circle().fill(.ultraThinMaterial))
                    .background(
                        Image(systemName: "hexagon")
                            .symbolVariant(.fill)
                            .foregroundStyle(.blue)
                            .font(.system(size: 200))
                            .offset(x: -50, y: -100)
                    )
                
                
                Section {
                    Text("Settings")
                    Text("Billing")
                    Text("Help")
//                    Image(systemName: "person.3.sequence")
//                        .symbolVariant(.fill)
//                        .symbolRenderingMode(.palette)
//                        .foregroundStyle(.yellow, .red, .teal)
//                        .font(.largeTitle)
                }
                .listRowSeparatorTint(.blue)
                .listRowSeparator(.hidden)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
