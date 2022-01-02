import SwiftUI

public struct TitleFirstLabelStyle: LabelStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            Spacer()
            configuration.icon
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
        .font(.title3.bold())
        .foregroundColor(Color("blue"))
    }
}

// func labelStyle<S>(_ style: S) -> some View where S : LabelStyle
public extension LabelStyle where Self == TitleFirstLabelStyle {
    static var titleFirst: Self { .init() }
}

struct PopularHabitView: View {
    var body: some View {
        VStack {
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
                        Text("Read Books")
                    } icon: {
                        Image(systemName: "book")
                    }
                  
                }
                .tint(Color("lightBlue"))
            }
            HStack {}
        }
        .labelStyle(.titleFirst)
        .buttonStyle(.borderedProminent)
        .padding()
    }
}

struct PopularHabitView_Previews: PreviewProvider {
    static var previews: some View {
        PopularHabitView()
    }
}
