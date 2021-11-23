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
            
            HStack {
             
                VStack {
                    
                    VStack() {
                        
                        HStack {
                            Button(icon: .init(systemName: "mail.stack"), title: "All Habits") {
                                
                            }
                            
                            Button(icon: .init(systemName: "plus"), title: "All Habits") {
                                
                            }
                            Spacer()
                            
                        }
                        .buttonStyle(.plain)
                        
                      

                    }
                  .padding(.leading, 18)
        
                
                    VStack(spacing: 6) {
                        
                        Image(systemName: "archivebox")
                            .font(.system(size: 50))
                            .padding(20)
                        
                        Text("The start of a better You!")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Habits are like dominos. As one is formed, all other will follow!")
                            .font(.caption)
                        .multilineTextAlignment(.center)
                            .frame(width: 200)
                        
                        HStack {
                            
                            Button(icon: .init(systemName: "mail.stack"), title: "All Habits") {
                                
                            }
                            
                            Button(icon: .init(systemName: "plus"), title: "All Habits") {
                                
                            }
                            
                            Button(icon: .init(systemName: "plus"), title: "All Habits") {
                                
                            }
                            
                        }
                        .buttonStyle(.plain)
                        
                        HStack {
                            
                            Button(icon: .init(systemName: "mail.stack"), title: "All Habits") {
                                
                            }
                            
                            Button(icon: .init(systemName: "plus"), title: "All Habits") {
                                
                            }
                            
                        }
                        .buttonStyle(.plain)
                        
                    }
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(4)
                    
                    
                    
                    TabView() {
                        
                        Text("Journal")
                            .tabItem {
                                Image(systemName: "swift")
                                Text("Journal")
                            }
                        
                        Text("Progress")
                            .tabItem {
                                Image(systemName: "swift")
                                Text("Progress")
                            }
                        
                        Text("Upgrade")
                            .tabItem {
                                Image(systemName: "swift")
                                Text("Upgrade")
                            }
                        
                        Text("Settings")
                            .tabItem {
                                Image(systemName: "swift")
                                Text("Settings")
                            }
                    }
                    
                    
                }
                .navigationTitle(Text("Today").foregroundColor(.green)
                )
                .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
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
            }
            
        }.overlay(ZStack {
            Image("JournalEmpty")
                .resizable()
                .opacity(0.3)
        })
    }
}

struct HabitContentView_Previews: PreviewProvider {
    static var previews: some View {
        HabitContentView()
            .ignoresSafeArea()
    }
}
