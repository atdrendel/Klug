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
                VStack {
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
                    
                    Text("Codebendr")
                        .font(.title.weight(.semibold))
                    HStack {
                        Image(systemName: "location")
                            .imageScale(.small)
                        Text("Canada")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Section {
                    
                    NavigationLink {
                        ContentView()
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
       
                    NavigationLink {
                        ContentView()
                    } label: {
                        Label("Billing", systemImage: "creditcard")
                    }
       
                    NavigationLink {
                        ContentView()
                    } label: {
                        Label("Settings", systemImage: "gear")
                    }
       
                    Image(systemName: "person.3.sequence")
                        .symbolVariant(.fill)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.yellow, .red, .teal)
                        .font(.largeTitle)
                }
                .accentColor(.primary)
                .listRowSeparatorTint(.blue)
                .listRowSeparator(.hidden)
                
                Link(destination: .init(string: "https://designcode.io/swiftui-ios15-navigation-link-url")!) {
                    Label("Link", systemImage: "house")
                }
                
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
