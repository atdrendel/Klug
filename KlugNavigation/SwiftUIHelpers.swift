//
//  SwiftUIHelpers.swift
//  KlugNavigation
//
//  Created by Evans Domina Attafuah on 09/10/2021.
//

import SwiftUI

public extension Binding {
    func isPresent<Wrapped>() -> Binding<Bool> where Value == Wrapped? {
        .init(
            get: { self.wrappedValue != nil },
            set: { isPresented in
                if !isPresented {
                    self.wrappedValue = nil
                }
            }
        )
    }
}

extension View {
    func alert<A: View, M: View, T>(
        title: (T) -> Text,
        presenting data: Binding<T?>,
        @ViewBuilder actions: @escaping (T) -> A,
        @ViewBuilder message: @escaping (T) -> M) -> some View {
            self.alert(
                data.wrappedValue.map(title) ?? Text("Delete"),
                isPresented: data.isPresent(),
                presenting: data.wrappedValue,
                actions: actions,
                message: message)
        }
    
}
