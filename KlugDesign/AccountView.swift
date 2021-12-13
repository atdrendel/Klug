//
//  AccountView.swift
//  KlugDesign
//
//  Created by Evans Domina Attafuah on 13/12/2021.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    
    var body: some View {
        NavigationView {
            List {
                profile
                menu
                links
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
        }
    }
    
    var profile: some View {
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
            
            Text("codebendr")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text("Ghana")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
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
    }
    
    var links: some View {
        Section {
            if !isDeleted {
                Link(destination: .init(string: "https://apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
         
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        isDeleted.toggle()
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
                .swipeActions {
                    pinButton
                }
            }
            Link(destination: .init(string: "https://youtube.com")!) {
                HStack {
                    Label("Youtube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .accentColor(.primary)
    }
    
    var pinButton: some View {
        Button {
            isPinned.toggle()
        } label: {
            isPinned ?
                Label("Unpin", systemImage: "pin.slash") :
                Label("Pin", systemImage: "pin")
        }
        .tint(isPinned ? .gray : .yellow)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AccountView()
            AccountView()
                .preferredColorScheme(.dark)
        }
    }
}
