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
            
            ZStack {
                Color("seaBlue")
                    .ignoresSafeArea()
                
                VStack {
                    
                    NewHabitView()
                    
                    Spacer().frame(height:100)
                    
                    MainTabView()
                    
                    
                }
                
                .navigationTitle (
                    Text("Today")
                        .foregroundColor(.green)
                )
                .toolbar{
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        HStack {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                
                                Image(systemName: "graduationcap.circle.fill")
                                    .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                                .foregroundColor(Color("blue"))
                                
                            })
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            
                            Image(systemName: "calendar.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                                .foregroundColor(Color(.black))
                            
                        })
                    }
                }
            }
      
        }
        //        .overlay(ZStack {
        //            Image("JournalEmpty")
        //                .resizable()
        //                .opacity(0.0)
        //        })
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
            
            Spacer().frame(height: 120)
            
            
        }
        .padding()
        .background(Color("lightGreen"))
        .cornerRadius(12)
    }
}

struct AddHabitView: View {
    var body: some View {
        ZStack() {
            HStack {
                Spacer()
                Circle()
                    .fill(Color("blue"))
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 26, weight: .semibold, design: .rounded))
                            .foregroundColor(.white)
                    )
            }
            .padding(.trailing, 40)
        }
        .offset(y: -40)
    }
}

struct MainTabView: View {
    init() {
        let tabbar = UITabBar.appearance()
        tabbar.backgroundColor = .init(named: "blue")
        tabbar.barTintColor = .white
        tabbar.unselectedItemTintColor = .init(named: "gray")
        tabbar.isTranslucent = false
    }
    var body: some View {
        TabView() {
            
            VStack {
                
                NewHabitEmptyState()
                AddHabitView()
                
                ZStack {
                    Color("seaBlue")
                }
                
            }
            .background(Color("seaBlue"))
            .tabItem {
                Image(systemName: "square.stack.fill")
                Text("Journal")
            }
            
            
            
            Text("Progress")
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("Progress")
                }
            
            Text("Upgrade")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Upgrade")
                }
            
            Text("Settings")
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Settings")
                }
        }
        
        .accentColor(Color("yellow"))
    }
}



