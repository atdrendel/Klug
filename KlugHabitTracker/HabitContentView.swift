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
            
                VStack {
                    
                    NewHabitView()
                    
                    Spacer().frame(height:100)
                    
                    TabView() {
                        
                        VStack {
                        
                            NewHabitEmptyState()
                            AddHabitView()
                        }
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
                .navigationTitle (
                    Text("Today")
                        .foregroundColor(.green)
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
            
            
        }.overlay(ZStack {
            Image("JournalEmpty")
                .resizable()
                .opacity(0.0)
        })
    }
}

struct HabitContentView_Previews: PreviewProvider {
    static var previews: some View {
        HabitContentView()
            .ignoresSafeArea()
    }
}

struct NewHabitView: View {
    var body: some View {
        VStack {
            
            HStack {
                
                Button(icon: .init(systemName: "mail.stack"), title: "All Habits") {
                    
                }
                
                Button(icon: .init(systemName: "plus"), title: "New Area") {
                    
                }
                
                Spacer()
                
            }
            .buttonStyle(.plain)
            
            
            
        }
        .padding(.leading, 18)
    }
}

struct NewHabitEmptyState: View {
    var body: some View {
        VStack(spacing: 6) {
            
            Image(systemName: "archivebox")
                .font(.system(size: 50))
                .foregroundColor(.black.opacity(0.7))
                .padding(20)
            
            Text("The start of a better You!")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Habits are like dominos. As one is formed, all other will follow!")
                .font(.title3)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            
            
            HStack {
                
                Button(icon: .init(systemName: "leaf"), title: "Meditate") {
                    
                }
                
                Button(icon: .init(systemName: "list.bullet"), title: "Set a To-do List") {
                    
                }
                
                Button(icon: .init(systemName: "figure.walk"), title: "Walk") {
                    
                }
                
            }
            .buttonStyle(.plain)
            .padding(.top, 10)
            
            HStack {
                
                Button(
                    icon: .init(systemName: "drop.fill"),
                    title: "Drink Water"
                ) {
                    
                }
                
                Button(icon: .init(systemName: "book"), title: "Read Books") {
                    
                }
                
            }
            .buttonStyle(.plain)
            .padding(.bottom, 10)
            
        //    Spacer().frame(height: 120)
            
            
            
            
        }
        .padding()
        .background(.gray.opacity(0.4))
        .cornerRadius(12)
    }
}

struct AddHabitView: View {
    var body: some View {
        ZStack() {
            HStack {
                Spacer()
                Circle()
                    .frame(width: 80, height: 80)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
            }
            .padding(.trailing, 40)
        }
        .offset(y: -50)
    }
}
