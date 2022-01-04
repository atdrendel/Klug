import SwiftUI

public struct TextFieldHabitStyle: TextFieldStyle {
    public init() {}
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.body.bold())
    }
}

public struct HabitListItemLabelStyle: LabelStyle {
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

public extension LabelStyle where Self == HabitListItemLabelStyle {
    static var habitListItem: Self { .init() }
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
                            .labelStyle(.habitListItem)
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
