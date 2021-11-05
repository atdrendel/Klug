//
//  ContentView.swift
//  KlugHabitTracker
//
//  Created by Evans Domina Attafuah on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                   
                    Spacer()
                }
                .padding(.leading, 30)
                .padding(.top, 20)
                
                Spacer()
                
            }.navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                
                HStack(spacing: 16) {
                    Image(systemName: "calendar.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .leading)
                        .foregroundColor(Color(.black))
                    Image(systemName: "calendar.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .leading)
                        .foregroundColor(Color(.black))
                }
            }))
            
        }.overlay(ZStack {
            Image("JournalEmpty")
                .resizable()
                .opacity(0.5)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .ignoresSafeArea()
    }
}
