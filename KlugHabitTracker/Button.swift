//
//  Button.swift
//  KlugHabitTracker
//
//  Created by Evans Domina Attafuah on 25/11/2021.
//

import SwiftUI

struct HabitButtonStyle: ButtonStyle {
    
    var strokeColor: Color
    var fillColor: Color
    var fontColor: Color
    
    func makeBody(configuration: Self.Configuration)
    -> some View {
        configuration.label
            .font(.caption2)
            .frame(height:0)
            .padding()
            .foregroundColor(fontColor)
            .background(
                Capsule()
                    .fill(fillColor)
                    .overlay(
                        Capsule()
                            .stroke(strokeColor)
                    )
            )
    }
}

extension ButtonStyle where Self == HabitButtonStyle {
    
    static var primary: Self {
        HabitButtonStyle(
            strokeColor: .clear,
            fillColor: .init("lightBlue"),
            fontColor: .init("blue")
        )
    }
    
    static var secondary: Self {
        HabitButtonStyle(
            strokeColor: .white,
            fillColor: .init("seaBlue"),
            fontColor: .init("blue")
        )
    }
    
    static var accent: Self {
        HabitButtonStyle(
            strokeColor: .clear,
            fillColor: .init("lightGreen"),
            fontColor: .init("blue")
        )
    }
    
    static var alt: Self {
        HabitButtonStyle(
            strokeColor: .init("green"),
            fillColor: .init("lightGreen"),
            fontColor: .init("green")
        )
    }
}

struct HabitText: View {
    @Binding var count: Int
    var text: String
    init(_ text: String, _ count: Binding<Int> = .constant(0)) {
        self.text = text
        self.count = count.wrappedValue
    }
    var body: some View {
        count > 0 ? Text("\(text) \(count)") : Text(text)
    }
}


typealias HabitButtonTupleView = TupleView<(Image, HabitText)>
typealias HabitButton = HStack<HabitButtonTupleView>



extension Button where Label == HabitButton {
    init(action: @escaping () -> Void, @ViewBuilder habit: () -> HabitButtonTupleView) {
        self.init(action: action) {
            HStack(content: habit)
        }
    }
}

//struct HabitButton: View {
//    let buttonStyle: HabitButtonStyle
//    init(_ buttonStyle: HabitButtonStyle) {
//        self.buttonStyle = buttonStyle
//    }
//    var body: some View {
//        Button(action: {}) {
//            HStack {
//                Image(systemName: "mail.stack")
//                Text("All Habits")
//                Text("0")
//            }
//        }
//        .buttonStyle(buttonStyle)
//    }
//}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            Button(role: .destructive) {
                
            } label: {
                
            }

            
            Image("Buttons")
                .resizable()
                .frame(width: 379, height: 322)
            
            Button {
                
            } habit: {
                    Image(systemName: "leaf")
                HabitText("All Habits", .constant(0))
            }
            .buttonStyle(.primary)
            
            Button {
                
            } habit: {
                    Image(systemName: "plus")
                    Text("New Area")
                    Text("0")
                
            }
            .buttonStyle(.secondary)
            
            Button {
                
            } habit: {
               
                    Image(systemName: "mail.stack")
                    Text("All Habits")
                    Text("0")
                
            }
            .buttonStyle(.accent)
            
            Button {
                
            } habit: {
              
                    Image(systemName: "list.dash")
                    Text("Set a To-do List")
                    Text("")
                
            }
            .buttonStyle(.alt)
    
        }
        .padding()
        .background(Color("seaBlue"))
        .previewLayout(.sizeThatFits)
    }
}
