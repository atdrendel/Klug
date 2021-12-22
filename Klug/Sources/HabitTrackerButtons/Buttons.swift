import SwiftUI

public struct HabitButtonStyle: ButtonStyle {
    var strokeColor: Color
    var fillColor: Color
    var fontColor: Color
    
    public func makeBody(configuration: Self.Configuration)
        -> some View
    {
        configuration.label
            .font(.caption2)
            .frame(height: 0)
            .padding()
            .foregroundColor(fontColor)
            .background(
                Capsule()
                    .fill(configuration.isPressed ? fillColor.opacity(0.3) : fillColor.opacity(1))
                    .overlay(
                        Capsule()
                            .stroke(configuration.isPressed ? strokeColor.opacity(0.3) : strokeColor.opacity(1))
                    )
            )
            .scaleEffect(.init(configuration.isPressed ? 0.8 : 1))
            .animation(.easeOut, value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == HabitButtonStyle {
    public static var primary: Self {
        .init(
            strokeColor: .clear,
            fillColor: .init("lightBlue"),
            fontColor: .init("blue")
        )
    }
    
    public static var secondary: Self {
        .init(
            strokeColor: .white,
            fillColor: .init("seaBlue"),
            fontColor: .init("blue")
        )
    }
    
    public static var accent: Self {
        .init(
            strokeColor: .clear,
            fillColor: .init("lightGreen"),
            fontColor: .init("blue")
        )
    }
    
    public static var alt: Self {
        .init(
            strokeColor: .init("green"),
            fillColor: .init("lightGreen"),
            fontColor: .init("green")
        )
    }
}

extension Text {
    public init(habit: String, count: Binding<Int> = .constant(0)) {
        let _count = count.wrappedValue > 0 ? "\(count.wrappedValue)" : ""
        self.init("\(habit)   \(_count)")
    }
}

public typealias HabitButtonTupleView = TupleView<(Image, Text)>
public typealias HabitButton = HStack<HabitButtonTupleView>

extension Button where Label == HabitButton {
     public init(action: @escaping () -> Void, @ViewBuilder habit: () -> HabitButtonTupleView) {
        self.init(action: action) {
            HStack(content: habit)
        }
    }
}


struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
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
            
            Button {} habit: {
                Image(systemName: "mail.stack")
                Text(habit: "All Habits", count: .constant(2))
            }
            .buttonStyle(.accent)
            
            Button {} habit: {
                Image(systemName: "list.dash")
                Text(habit: "Set a To-do List")
            }
            .buttonStyle(.alt)
        }
        .padding()
        .background(Color("seaBlue"))
        .previewLayout(.sizeThatFits)
    }
}
