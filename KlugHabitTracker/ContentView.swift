//
//  ContentView.swift
//  KlugHabitTracker
//
//  Created by Evans Domina Attafuah on 05/11/2021.
//

import SwiftUI
import Klug

struct HabitContentView: View {
    var body: some View {
        NavigationView {
            
            HStack() {
                
                VStack(alignment: .leading, spacing: -25) {
                    
                    Text("Today")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    Button(icon: .init(systemName: "mail.stack"), title: "All Habits") {
                        
                    }
                    .buttonStyle(.plain)

                    
                   Spacer()
                    
                    ProgressView(value: 1)
                        .tint(.green)
                    
                    ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                        .progressViewStyle(.circular)

                    Spacer()
                }
              .padding(.leading, 18)
              
//                .padding(.top, 20)
                
                Spacer()
                
            }.navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                
                HStack(spacing: 16) {
                    Image(systemName: "graduationcap.circle.fill")
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
                .opacity(0.1)
        })
    }
}

struct HabitContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .ignoresSafeArea()
    }
}
