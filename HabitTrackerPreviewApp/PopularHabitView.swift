import SwiftUI

public struct TitleFirstLabelStyle: LabelStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            Spacer()
            configuration.icon
        }
        .padding(.vertical, 10)
        .font(.body.bold())
        .foregroundColor(Color("blue"))
    }
}

// func labelStyle<S>(_ style: S) -> some View where S : LabelStyle
public extension LabelStyle where Self == TitleFirstLabelStyle {
    static var titleFirst: Self { .init() }
}

struct PopularHabitView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Most Popular Habits")
                    .font(.title3.weight(.semibold))
                    .padding(.vertical)
                   
                HStack {
                    Button {} label: {
                        Label {
                            Text("Meditation")
                        } icon: {
                            Image(systemName: "aqi.medium")
                        }
                    }
                    .tint(Color("seaBlue"))
                    
                    Button {} label: {
                        Label {
                            Text("Read Books")
                        } icon: {
                            Image(systemName: "book")
                        }
                    }
                    .tint(Color("yellow").opacity(0.7))
                }
                
                VStack {
                    Button {} label: {
                        Label {
                            Text("Set a To-do List")
                        } icon: {
                            Image(systemName: "list.star")
                        }
                    }
                    .tint(Color("lightBlue"))
                }
                
                HStack {
                    Button {} label: {
                        Label {
                            Text("Drink Water")
                        } icon: {
                            Image(systemName: "drop")
                        }
                    }
                    .tint(Color("purple"))
                    
                    Button {} label: {
                        Label {
                            Text("Running")
                        } icon: {
                            Image(systemName: "heart")
                        }
                    }
                    .tint(Color("pink"))
                }
                
                Spacer()
                
                HStack {
                    Button {} label: {
                        Label("Create your own", systemImage: "plus.circle")
                            .padding()
                            .labelStyle(.titleAndIcon)
                    }
                    .buttonStyle(.secondary(.two))
                }
            }
            .labelStyle(.titleFirst)
            .buttonStyle(.borderedProminent)
            .padding()
//        .navigationBarHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {} label: {
                        Text("Close")
                            .bold()
                            .foregroundColor(.habitBlue)
                    }
                    .buttonStyle(.plain)
                }
                ToolbarItem() {
                    Button {} label: {
                        Text("Save")
                            .bold()
                            .foregroundColor(.habitBlue)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

struct PopularHabitView_Previews: PreviewProvider {
    static var previews: some View {
        PopularHabitView()
    }
}
