import SwiftUI

public struct TextFieldHabitStyle: TextFieldStyle {
    public init() {}
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration.font(.body.bold())
    }
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
                    List(0 ..< 5) { _ in
                        NavigationLink {
                            Text("")
                        } label: {
                            HStack {
                                Image(systemName: "swift")
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 40)
                                    .background(RoundedRectangle(cornerSize: .init(width: 12, height: 12)))

                                VStack(alignment: .leading) {
                                    Text("Swift")
                                    Text("subtitle")
                                        .font(.callout.weight(.light))
                                }
                            }
                            .padding(.vertical, 10)
                            .font(.body.bold())
                            .foregroundColor(Color("blue"))
                        
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
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HabitListView: View {
    let icon: String
    let title: String
    let subtitle: String
    var color: Color = .teal
    
    var body: some View {
        NavigationLink {
            Text("")
        } label: {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .frame(width: 40, height: 40)
                    .background(
                        RoundedRectangle(
                            cornerSize: .init(width: 12, height: 12)
                        )
                            .fill(color.opacity(0.3))
                    )
                    .font(.title2)

                VStack(alignment: .leading) {
                    Text(subtitle)
                        .font(.caption.weight(.light))
                        .foregroundColor(.secondary)
                    Text(title)
                        .foregroundColor(Color("blue"))
                }
            }
            .padding(.vertical, 10)
            .font(.body.bold())
        }

    }
}

struct CreateHabit_Previews: PreviewProvider {
    static var previews: some View {
        CreateHabit()
    }
}
