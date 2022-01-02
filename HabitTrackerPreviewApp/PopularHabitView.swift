import SwiftUI

public struct TitleFirstLabelStyle: LabelStyle {
    
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

//func labelStyle<S>(_ style: S) -> some View where S : LabelStyle
extension LabelStyle where Self == TitleFirstLabelStyle {
    public static var titleFirst: Self { .init() }
}

struct PopularHabitView: View {
    var body: some View {
        HStack {
            HStack {
                Button {} label: {
                    Label {
                        Text("Hello")
                    } icon: {
                        Image(systemName: "heart")
                    }
                    .labelStyle(.titleFirst)
                }
            }
            VStack {}
            HStack {}
        }
    }
}

struct PopularHabitView_Previews: PreviewProvider {
    static var previews: some View { PopularHabitView()
    }
}
