import SwiftUI

public struct TextFieldHabitStyle: TextFieldStyle {
    public init() {}
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration.font(.body.bold())
    }
}

public struct HabitListItemLabelStyle: LabelStyle {
    private let backgroundColor: Color
    private let color: Color
    private let subtitle: String

    public init(
        background: Color = Color("green"),
        color: Color = Color("green"),
        subtitle: String = "")
    {
        self.backgroundColor = background
        self.color = color
        self.subtitle = subtitle
    }

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .foregroundColor(.white)
                .frame(width: 40, height: 40)
                .background(RoundedRectangle(cornerSize: .init(width: 12, height: 12)))

            VStack(alignment: .leading) {
                Text("subtitle")
                    .font(.callout.weight(.light))
                configuration.title
            }
        }
        .padding(.vertical, 10)
        .font(.body.bold())

        .foregroundColor(Color("blue"))
    }
}

public extension LabelStyle where Self == HabitListItemLabelStyle {
    static func habitListItem(background: Color = Color("green"),
                              color: Color = Color("green"),
                              subtitle: String = "") -> Self { .init(background: background, color: color, subtitle: subtitle) }
}

public extension TextFieldStyle where Self == TextFieldHabitStyle {
    static var bold: Self { .init() }
}

struct CreateHabit: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Habit", text: .constant(""))
                        .textFieldStyle(.bold)
                }

                Section {
                    List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { _ in
                        NavigationLink {
                            Text("")
                        } label: {
                            Label {
                                Text("Swift")
                            } icon: {
                                Image(systemName: "swift")
                            }
                            .labelStyle(.habitListItem(background: .pink, color: .green, subtitle: "some text"))
                        }
                    }
                }
            }
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
                ToolbarItem {
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

struct CreateHabit_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabit()
    }
}
