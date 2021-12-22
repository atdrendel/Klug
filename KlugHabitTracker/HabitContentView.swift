import HabitTrackerButtons
import Klug
import SwiftUI

struct HabitContentView: View {
    @State var isPresented = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "green")!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "green")!]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("seaBlue")
                    .ignoresSafeArea()
                
                VStack {
                    NewHabitView()
                    
                    Spacer().frame(height: 100)
                    
                    MainTabView()
                }
                
                .navigationTitle("Today")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "graduationcap.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                                .foregroundColor(Color("blue"))
                            
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "calendar.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                                .foregroundColor(Color("blue"))
                            
                        })
                    }
                }
            }
        }
        .sheet(isPresented: $isPresented, onDismiss: {}) {
            NavigationView {
                NewHabitEmptyState()
                    .navigationTitle("New Habit")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isPresented = false
                            } label: {
                                Image(systemName: "xmark.circle.fill").resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.init("blue"))
                            }
                        }
                    }
            }
        }
        .overlay(ZStack {
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
                
                Button {} habit: {
                    Image(systemName: "leaf")
                    Text(
                        habit: "All Habits",
                        count: .constant(1)
                    )
                }
                .buttonStyle(.primary)

                Button {} habit: {
                    Image(systemName: "plus")
                    Text(habit: "New Area")
                }
                .buttonStyle(.secondary)
                
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
            Spacer()
            
            Image(systemName: "archivebox")
                .font(.system(size: 40))
                .foregroundColor(.black.opacity(0.7))
//
            
            Text("The start of a better You!")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Text("Habits are like dominos. As one is formed, all other will follow!")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .padding(.top, 0)
            
            HStack {
                Button(icon: .init(systemName: "leaf"), title: "Meditate") {}
                
                Button(icon: .init(systemName: "list.bullet"), title: "Set a To-do List") {}
                
                Button(icon: .init(systemName: "figure.walk"), title: "Walk") {}
            }
            .buttonStyle(.alt)
            .padding(.top, 10)
            
            HStack {
                Button(
                    icon: .init(systemName: "drop.fill"),
                    title: "Drink Water"
                ) {}
                
                Button(icon: .init(systemName: "book"), title: "Read Books") {}
            }
            .buttonStyle(.alt)
            .padding(.bottom, 10)
            
            Spacer().frame(height: 120)
        }
        .background(Color("lightGreen")
        )
        .cornerRadius(16)
        .padding(12.0)
        .padding(.horizontal, 5)
    }
}

struct AddHabitView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Button {} label: {
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
            }
        }
        .padding(.trailing, 30)
        .offset(y: -60)
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
        TabView {
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
